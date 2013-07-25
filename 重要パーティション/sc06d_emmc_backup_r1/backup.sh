# Copyright 2012 sakuramilk
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

#--------------------------------------------------------------------
#   SC-06D emmc backup tool r1
#--------------------------------------------------------------------

#!/system/bin/sh

BACKUP_DIR=/sdcard/tweakgs3/backup/`date +%Y-%m-%d.%H.%M.%S`
echo ">>>>> backup start -> $BACKUP_DIR"

mkdir -p $BACKUP_DIR

echo "mmcblk0p1 -> modem.bin"
busybox dd if=/dev/block/mmcblk0p1 of=$BACKUP_DIR/modem.bin bs=4096
echo "mmcblk0p2 -> sbl1.bin"
busybox dd if=/dev/block/mmcblk0p2 of=$BACKUP_DIR/sbl1.bin bs=4096
echo "mmcblk0p3 -> sbl2.bin"
busybox dd if=/dev/block/mmcblk0p3 of=$BACKUP_DIR/sbl2.bin bs=4096
echo "mmcblk0p4 -> sbl3.bin"
busybox dd if=/dev/block/mmcblk0p4 of=$BACKUP_DIR/sbl3.bin bs=4096
echo "mmcblk0p5 -> aboot.bin"
busybox dd if=/dev/block/mmcblk0p5 of=$BACKUP_DIR/aboot.bin bs=4096
echo "mmcblk0p6 -> rpm.bin"
busybox dd if=/dev/block/mmcblk0p6 of=$BACKUP_DIR/rpm.bin bs=4096
echo "mmcblk0p8 -> tz.bin"
busybox dd if=/dev/block/mmcblk0p8 of=$BACKUP_DIR/tz.bin bs=4096
echo "mmcblk0p9 -> pad.bin"
busybox dd if=/dev/block/mmcblk0p9 of=$BACKUP_DIR/pad.bin bs=4096
echo "mmcblk0p10 -> param.img"
busybox dd if=/dev/block/mmcblk0p10 of=$BACKUP_DIR/param.img bs=4096
echo "mmcblk0p11 -> efs.img"
busybox dd if=/dev/block/mmcblk0p11 of=$BACKUP_DIR/efs.img bs=4096
echo "mmcblk0p12 -> modemst1.img"
busybox dd if=/dev/block/mmcblk0p12 of=$BACKUP_DIR/modemst1.img bs=4096
echo "mmcblk0p13 -> modemst2.img"
busybox dd if=/dev/block/mmcblk0p13 of=$BACKUP_DIR/modemst2.img bs=4096
echo "mmcblk0p16 -> persist.img.ext4"
busybox dd if=/dev/block/mmcblk0p16 of=$BACKUP_DIR/persist.img.ext4 bs=4096
echo "mmcblk0p19 -> fota.bin"
busybox dd if=/dev/block/mmcblk0p19 of=$BACKUP_DIR/fota.bin bs=4096
echo "mmcblk0p20 -> backup.bin"
busybox dd if=/dev/block/mmcblk0p20 of=$BACKUP_DIR/backup.bin bs=4096
echo "mmcblk0p21 -> fgs.bin"
busybox dd if=/dev/block/mmcblk0p21 of=$BACKUP_DIR/fgs.bin bs=4096
echo "mmcblk0p22 -> ssd.bin"
busybox dd if=/dev/block/mmcblk0p22 of=$BACKUP_DIR/ssd.bin bs=4096
echo "mmcblk0p23 -> grow.bin"
busybox dd if=/dev/block/mmcblk0p23 of=$BACKUP_DIR/grow.bin bs=4096

CUR_DIR=$PWD
cd $BACKUP_DIR
busybox md5sum * > backup.md5
cd $CUR_DIR

echo ">>>>> backup complete"
echo "*********************"
echo "重要:$BACKUP_DIRの中身をすべてPCにコピーして大切に保管してください"
echo "*********************"
