#!/bin/sh

log="log.txt"
i=1
for dir in merge
do
    for bin in `ls $dir/*_0.bin`
    do
        echo "$i: $bin" >> $log
        ./TAppDecoder -b $bin -o out.yuv
        HM=`md5 out.yuv | awk '{print $4}'`
echo $HM
        adb push $bin /data/local/hevcd/stream
        cd ~/Downloads/git/scc_intra_decoder
        echo "/data/local/hevcd/stream/$bin" > name.txt
        source test.sh
        LIBHEVC=`md5 out.yuv | awk '{print $4}'`
echo $LIBHEVC
        cd -
        if [ "$HM"x = "$LIBHEVC"x ];then
            echo "decode success!" >> $log
        else
            echo "decode FAIL" >> $log
            break
        fi
        i=`expr $i + 1`
    done

    for bin in `ls $dir/*_1.bin`
    do
        echo "$i: $bin" >> $log
        ./TAppDecoder -b $bin -o out.yuv
        HM=`md5 out.yuv | awk '{print $4}'`
        echo $HM
        adb push $bin /data/local/hevcd/stream
        cd ~/Downloads/git/scc_intra_decoder
        echo "/data/local/hevcd/stream/$bin" > name.txt
        source test.sh
        LIBHEVC=`md5 out.yuv | awk '{print $4}'`
        echo $LIBHEVC
        cd -
        if [ "$HM"x = "$LIBHEVC"x ];then
            echo "decode success!" >> $log
        else
            echo "decode FAIL" >> $log
            break
        fi
        i=`expr $i + 1`
    done
done


#./TAppEncoder -c encoder_randomaccess_main_scc.cfg -c SlideShow_444.cfg --Log2ParallelMergeLevel= -b ALI_MERGE_G.bin
