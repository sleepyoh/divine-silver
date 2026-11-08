# divine-silver (sleepy-linux)

Custom Fedora Silverblue (GNOME) bootc image for my laptops. Not meant for anyone else.

Published as `ghcr.io/sleepyoh/sleepy-linux:latest`.

## Hardware

One image, two laptops. Every change has to work on both:

- **ThinkPad T14 Gen 1**: Ryzen 5 PRO 4650U, Radeon graphics, MediaTek MT7921 Wi-Fi
- **ThinkPad T450**: Intel Broadwell graphics, Intel Wi-Fi

Don't remove firmware packages, `microcode_ctl`, `thermald`, `intel-lpmd`, `fprintd` or
`iio-sensor-proxy`, and keep bluetooth enabled. Install drivers for both GPUs; libva picks
the right one at runtime.

## Goals

- **One update mechanism.** The image is the only way anything updates. Apps must not have
  their own updater or a separate update channel.
- **Native apps.** RPMs or files baked into `/usr`. No Flatpak apps if at all possible. The
  `flatpak` program stays installed, but nothing in the image relies on it.
- **Bake everything in.** If I use it, it belongs in the image, not installed on the running
  system afterwards.
- **Keep the structure as it is.** Small numbered scripts, one job each, easy to read and
  extend. Don't consolidate, abstract or restructure them.

## Where things go

`build_files/build.sh` copies `system_files/` into the image root, then runs each script in order:

| Script | Purpose |
|---|---|
| `01packages.sh` | Fedora repo: CLI tools, applications, and removal of defaults I don't use |
| `02rpmfusion.sh` | RPM Fusion: codecs, AMD and Intel VA drivers, apps (Steam etc.) |
| `03thirdparty.sh` | Apps from vendor repos (`.repo` files in `system_files/etc/yum.repos.d/`) |
| `04missioncenter.sh` | Mission Center, extracted from its AppImage into `/usr/lib` |
| `05systemctl.sh` | Enable and disable services |
| `06cleanup.sh` | Disable or remove repos, clean up so `bootc container lint` passes |

`system_files/` mirrors the filesystem root. Config files go there at their real path.

## Adding an app

Use the first source that has it:

1. Fedora repos: add to the applications list in `01packages.sh`
2. RPM Fusion: `02rpmfusion.sh`
3. Vendor RPM repo: add the `.repo` file, install in `03thirdparty.sh`, and disable the repo
   in `06cleanup.sh`
4. Upstream release: new numbered script that fetches the latest release at build time and
   installs into `/usr/lib`, with a launcher in `/usr/bin` and a `.desktop` file. Follow
   `04missioncenter.sh`, renumber the later scripts, and add it to `build.sh`
5. Flatpak: only as a last resort, and ask me first

Fetch the latest release rather than pinning a version, so the daily build keeps apps current.

## Rules that are easy to break

- This is GNOME, so the removal list in `sleepy-kde` can't be copied. `gnome-shell` requires
  `ibus`; `gnome-control-center` requires `malcontent`, `malcontent-control`, `cups-pk-helper`
  and `cups-libs`. Removing those takes the desktop with them.
- `systemctl disable` fails the build if the unit doesn't exist. Packages removed in
  `01packages.sh` must not be disabled in `05systemctl.sh`. The commented-out lines and
  REMINDERs there record which ones to restore if a removal block is ever deleted.
- A script that installs an icon outside an RPM must run `gtk-update-icon-cache -f -t` on that
  theme, or GNOME won't show it (deployed files share one timestamp, so a stale cache looks valid).
- Repos used during the build are removed or disabled again in `06cleanup.sh`.
- `/run` and `/var` leftovers must be cleaned in `06cleanup.sh` so the lint step stays clean.
- `/tmp` is a tmpfs at build time, so it never reaches the image.
- Bumping Fedora means updating `FEDORA_MAJOR_VERSION` in `Containerfile` and `IMAGE_DESC` in
  `image-template.env`.

## Build and release

- Work happens on `apps-test`, then a PR into `main`.
- GitHub Actions builds on PRs, but only publishes from `main` (on push, daily at 10:05 UTC,
  or manually). The daily build is how packages and apps get updated.
- Local build: `just build sleepy-linux latest` (podman rejects the uppercase default name).
  Check Justfile syntax: `just check`.
- The Justfile's VM and disk image recipes are template leftovers: `disk_config/` was removed.
