#!/usr/bin/env bash

AOSIP_PATH=$PWD
TAG="android-10.0.0_r${1:?}"
SRC="ten"

do_not_merge="vendor/aosip manifest updater packages/apps/OmniSwitch packages/apps/OmniStyle \
packages/apps/OwlsNest external/google packages/apps/Launcher3 hardware/qcom/power \
packages/apps/Gallery2 device/qcom/common device/qcom/sepolicy device/aosip/sepolicy \
external/DUtils packages/apps/DUI packages/apps/Updater packages/apps/FMRadio \
packages/apps/SlimRecents packages/services/OmniJaws packages/apps/LockClock \
packages/apps/CalendarWidget hardware/qcom/fm  external/ant-wireless/ant_native \
external/ant-wireless/ant_service external/ant-wireless/antradio-library  external/bash \
external/brctl external/chromium-webview external/connectivity external/busybox external/htop \
external/fuse external/exfat external/ebtables external/ffmpeg external/gson vendor/codeaurora/telephony \
external/json-c external/libncurses external/libnetfilter_conntrack prebuilts/build-tools prebuilts/clang/host/linux-x86 \
system/qcom external/libnfnetlink external/libnfc-nxp external/nano external/ntfs-3g vendor/qcom/opensource/cryptfs_hw \
vendor/qcom/opensource/dataservices vendor/qcom/opensource/interfaces vendor/qcom/opensource/rcs-service packages/apps/MusicFX"

AOSP="https://android.googlesource.com"

for filess in failed success notaosp; do
    rm $filess 2> /dev/null
    touch $filess
done

. build/envsetup.sh || exit 1
repo sync --detach --quiet

# AOSiP manifest is setup with repo path first, then repo name, so the path attribute is after 2 spaces, and the path itself within "" in it
while read -r repos; do
    echo -e ""
    # shellcheck disable=SC2076,SC2154
    if [[ ${do_not_merge} =~ ${repos} ]]; then
        echo -e "${repos} is not to be merged"
    else
        echo "$blu Merging $repos $end"
        echo -e ""
        cd "$repos" || continue
        if [[ $repos == "build/make" ]]; then
            repos="build"
        fi
        git branch -D $SRC
        git checkout -b $SRC m/$SRC
        git remote rm aosp 2> /dev/null
        git remote add aosp "${AOSP}/platform/$repos"
        if ! git fetch aosp --quiet --tags; then
            echo "$repos" >> "${AOSIP_PATH}"/notaosp
        else
            if ! git merge "${TAG}" --no-edit; then
                echo "$repos" >> "${AOSIP_PATH}"/failed
                echo "$red $repos failed :( $end"
            else
                if [[ "$(git rev-parse HEAD)" != "$(git rev-parse aosip/${SRC})" ]]; then
                    echo "$repos" >> "${AOSIP_PATH}"/success
                    git commit --signoff --date="$(date)" --amend --no-edit
                    echo "$grn $repos succeeded $end"
                    echo "Pushing!"
                    gerrit
                    git push gerrit $SRC
                else
                    echo "$repos - unchanged"
                fi
            fi
        fi
        echo -e ""
        cd "${AOSIP_PATH}" || exit 1
    fi
done < <(grep 'remote="aosip"' "${AOSIP_PATH}"/.repo/manifests/snippets/aosip.xml | awk '{print $2}' | awk -F '"' '{print $2}' | grep -v caf)

echo "Repos that failed are - "
cat "$AOSIP_PATH"/failed
