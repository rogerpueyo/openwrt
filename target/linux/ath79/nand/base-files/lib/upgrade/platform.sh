# Copyright (C) 2011 OpenWrt.org

PART_NAME=firmware

REQUIRE_IMAGE_METADATA=1
platform_check_image() {
	return 0
}

RAMFS_COPY_BIN='fw_printenv fw_setenv nandwrite'
RAMFS_COPY_DATA='/etc/fw_env.config /var/lock/fw_printenv.lock'

platform_do_upgrade_mikrotik_nand() {
	CI_KERNPART=none
	local fw_mtd=$(find_mtd_part kernel)
	fw_mtd="${fw_mtd/block/}"
	[ -n "$fw_mtd" ] || return
	mtd erase kernel
	if $(tar xf "$1" sysupgrade-${2/,/_}/kernel -O > /dev/null 2>&1); then
		# ath79 sysupgrade images with per-device board name
		tar xf "$1" sysupgrade-${2/,/_}/kernel -O | nandwrite -o "$fw_mtd" -
	elif $(tar xf "$1" sysupgrade-routerboard/kernel -O > /dev/null 2>&1); then
		# downgrade to ar71xx sysupgrade images with generic "routerboard" board name
		tar xf "$1" sysupgrade-routerboard/kernel -O | nandwrite -o "$fw_mtd" -
	fi

	nand_do_upgrade "$1"
}

platform_do_upgrade() {
	local board=$(board_name)

	case "$board" in
	mikrotik,routerboard-922uags-5hpacd)
		platform_do_upgrade_mikrotik_nand "$1" "$2"
		;;
	glinet,gl-ar300m-nand|\
	glinet,gl-ar300m-nor)
		glinet_nand_nor_do_upgrade "$1"
		;;
	glinet,gl-ar750s-nor|\
	glinet,gl-ar750s-nor-nand)
		nand_nor_do_upgrade "$1"
		;;
	*)
		nand_do_upgrade "$1"
		;;
	esac
}
