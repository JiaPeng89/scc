#!/bin/bash
output_waveFront="waveFront.csv"
echo "FILE,WaveFrontSynchro">$output_waveFront
array=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
jarray=(ai ra lb lp)
#sequence=(SlideShow Console Desktop FlyingGraphics Map Programming Robot WebBrowsing WordEditing)
i=0
f=30
dir=merge
mkdir ${dir}
for WaveFrontSynchro in 0 1
do 
   echo "ALI_WAVEFRONT_${array[$i]},$WaveFrontSynchro">>$output_waveFront
   for s in SlideShow Console Desktop FlyingGraphics Map Programming Robot WebBrowsing WordEditing
   do
      j=0
	  for cfg in encoder_intra_main_scc
	  do
	     ./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --WaveFrontSynchro=$WaveFrontSynchro --IntraBlockCopyEnabled=0 --PaletteMode=0 -b ${dir}/ALI_WAVEFRONT_ai_${jarray[$j]}_${s}_${array[$i]}_0.bin
		 ./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --WaveFrontSynchro=$WaveFrontSynchro --IntraBlockCopyEnabled=1 --PaletteMode=0 -b ${dir}/ALI_WAVEFRONT_ai_${jarray[$j]}_${s}_${array[$i]}_0.bin
		 ./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --WaveFrontSynchro=$WaveFrontSynchro --IntraBlockCopyEnabled=0 --PaletteMode=1 -b ${dir}/ALI_WAVEFRONT_ai_${jarray[$j]}_${s}_${array[$i]}_0.bin
		 ./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --WaveFrontSynchro=$WaveFrontSynchro --IntraBlockCopyEnabled=1 --PaletteMode=1 -b ${dir}/ALI_WAVEFRONT_ai_${jarray[$j]}_${s}_${array[$i]}_0.bin
	   j=`expr $j+1`
       done
    done
    i=`expr $i+1`
done	
		 
		 
