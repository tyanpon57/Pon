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
#   SC-06D emmc restore tool r0
#--------------------------------------------------------------------

#!/system/bin/sh

RESTORE_DIR=$1

if [ ! -d "$RESTORE_DIR" ]; then
  echo "error: not found restore dir"
  echo "usage: restore.sh [backup dir]"
  exit
fi

echo ">>>>> restore start -> $RESTORE_DIR"

echo "modem.bin -> mmcblk0p1"
busybox dd of=/dev/block/mmcblk0p1 if=$RESTORE_DIR/modem.bin bs=4096
echo "sbl1.bin -> mmcblk0p2"
busybox dd of=/dev/block/mmcblk0p2 if=$RESTORE_DIR/sbl1.bin bs=4096
echo "sbl2.bin -> mmcblk0p3"
busybox dd of=/dev/block/mmcblk0p3 if=$RESTORE_DIR/sbl2.bin bs=4096
echo "sbl3.bin -> mmcblk0p4"
busybox dd of=/dev/block/mmcblk0p4 if=$RESTORE_DIR/sbl3.bin bs=4096
echo "aboot.bin -> mmcblk0p5"
busybox dd of=/dev/block/mmcblk0p5 if=$RESTORE_DIR/aboot.bin bs=4096
echo "rpm.bin -> mmcblk0p6"
busybox dd of=/dev/block/mmcblk0p6 if=$RESTORE_DIR/rpm.bin bs=4096
echo "tz.bin -> mmcblk0p8"
busybox dd of=/dev/block/mmcblk0p8 if=$RESTORE_DIR/tz.bin bs=4096
echo "pad.bin -> mmcblk0p9"
busybox dd of=/dev/block/mmcblk0p9 if=$RESTORE_DIR/pad.bin bs=4096
echo "param.img -> mmcblk0p10"
busybox dd of=/dev/block/mmcblk0p10 if=$RESTORE_DIR/param.img bs=4096
echo "efs.img -> mmcblk0p11"
busybox dd of=/dev/block/mmcblk0p11 if=$RESTORE_DIR/efs.img bs=4096
echo "modemst1.img -> mmcblk0p12"
busybox dd of=/dev/block/mmcblk0p12 if=$RESTORE_DIR/modemst1.img bs=4096
echo "modemst2.img -> mmcblk0p13"
busybox dd of=/dev/block/mmcblk0p13 if=$RESTORE_DIR/modemst2.img bs=4096
echo "persist.img.ext4 -> mmcblk0p16"
busybox dd of=/dev/block/mmcblk0p16 if=$RESTORE_DIR/persist.img.ext4 bs=4096
echo "fota.bin -> mmcblk0p19"
busybox dd of=/dev/block/mmcblk0p19 if=$RESTORE_DIR/fota.bin bs=4096
echo "backup.bin -> mmcblk0p20"
busybox dd of=/dev/block/mmcblk0p20 if=$RESTORE_DIR/backup.bin bs=4096
echo "fgs.bin -> mmcblk0p21"
busybox dd of=/dev/block/mmcblk0p21 if=$RESTORE_DIR/fgs.bin bs=4096
echo "ssd.bin -> mmcblk0p22"
busybox dd of=/dev/block/mmcblk0p22 if=$RESTORE_DIR/ssd.bin bs=4096
echo "grow.bin -> mmcblk0p23"
busybox dd of=/dev/block/mmcblk0p23 if=$RESTORE_DIR/grow.bin bs=4096

echo ">>>>> restore complete"
echo "*********************"
echo "重要:エラーが発生した場合そのまま再起動すると再起不能になる可能性があります"
echo "エラーの内容を確認して修復を試みてください"
echo "*********************"

