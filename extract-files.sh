#!/bin/bash
#
# Copyright (C) 2023-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
    vendor/lib64/libgoodixhwfingerprint.so)
        patchelf --replace-needed "libvendor.goodix.hardware.fingerprintextension@1.0.so" "vendor.goodix.hardware.fingerprintextension@1.0.so" "${2}"
        ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

# Required!
export DEVICE=shark
export DEVICE_COMMON=sdm845-common
export VENDOR=xiaomi

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
