#!/usr/bin/bash
set -euox pipefail

rpm-ostree install \
		https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
		https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

		#There is an error upstream with confĺicting gstreamer packages since plasma 6.4 launched in fedora. This enables testing for now, until upstream fixes the conflict.
#sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/rpmfusion-free-updates-testing.repo
#sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/rpmfusion-nonfree-updates-testing.repo

rpm-ostree override remove \
		ffmpeg-free \
		libavcodec-free \
		libavdevice-free \
		libavfilter-free \
		libavformat-free \
		libavutil-free \
		libpostproc-free \
		libswresample-free \
		libswscale-free \
		--install=ffmpeg \
		--install=gstreamer1-plugin-libav \
		--install=gstreamer1-plugins-bad-free-extras \
		--install=gstreamer1-plugins-bad-freeworld \
		--install=gstreamer1-plugins-ugly \
		--install=gstreamer1-vaapi