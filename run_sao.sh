#!/bin/bash
output_sao="sao.csv"
echo "FILE,SaoLumaOffsetBitShift,SaoChromaOffsetBitShift,SAO,SaoEncodingRate,SaoEncodingRateChroma,MaxNumOffsetsPerPic,SAOLcuBoundary,SAOResetEncoderStateAfterIRAP">$output_sao
array=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
jarray=(ai ra lb lp)
#sequence=(SlideShow Console Desktop FlyingGraphics Map Programming Robot WebBrowsing WordEditing)
i=0

f=30
dir=sao
mkdir ${dir}
if SAO== 1 ;then
	for SaoEncodingRate in -1 0 0.75
	do 
		for SaoEncodingRateChroma in -1 0 0.5
		do 
			for MaxNumOffsetsPerPic in 1024 2048
			do 
				for SAOLcuBoundary in 0 1
				do 
					
					
					echo "ALI_SAO_${array[$i]},$SaoLumaOffsetBitShift,$SaoChromaOffsetBitShift,$SAO,$TestSAODisableAtPictureLevel,$SaoEncodingRate,$SaoEncodingRateChroma,$MaxNumOffsetsPerPic,$SAOLcuBoundary,$SAOResetEncoderStateAfterIRAP">>$output_sliceSegment
					for s in SlideShow Console Desktop FlyingGraphics Map Programing Robot WebBrowsing WordEditing
					do
						j=0
						#encoder_randomaccess_main_scc encoder_lowdelay_main_scc encoder_lowdelayp_main_scc
						for cfg in encoder_intra_main_scc
						do	
							./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=1 --SaoEncodingRate=$SaoEncodingRate --SaoEncodingRateChroma=$SaoEncodingRateChroma --MaxNumOffsetsPerPic=$MaxNumOffsetsPerPic --SAOLcuBoundary=$SAOLcuBoundary --IntraBlockCopyEnabled=0 --PaletteMode=0 -b ${dir}/ALI_SAO_ai_${jarray[$j]}_${s}_${array[$i]}_0.bin 										
							./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=1 --SaoEncodingRate=$SaoEncodingRate --SaoEncodingRateChroma=$SaoEncodingRateChroma --MaxNumOffsetsPerPic=$MaxNumOffsetsPerPic --SAOLcuBoundary=$SAOLcuBoundary --IntraBlockCopyEnabled=1 --PaletteMode=0 -b ${dir}/ALI_SAO_ai_${jarray[$j]}_${s}_${array[$i]}_1.bin
							./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=1 --SaoEncodingRate=$SaoEncodingRate --SaoEncodingRateChroma=$SaoEncodingRateChroma --MaxNumOffsetsPerPic=$MaxNumOffsetsPerPic --SAOLcuBoundary=$SAOLcuBoundary --IntraBlockCopyEnabled=0 --PaletteMode=1 -b ${dir}/ALI_SAO_ai_${jarray[$j]}_${s}_${array[$i]}_2.bin
							./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=1 --SaoEncodingRate=$SaoEncodingRate --SaoEncodingRateChroma=$SaoEncodingRateChroma --MaxNumOffsetsPerPic=$MaxNumOffsetsPerPic --SAOLcuBoundary=$SAOLcuBoundary --IntraBlockCopyEnabled=1 --PaletteMode=1 -b ${dir}/ALI_SAO_ai_${jarray[$j]}_${s}_${array[$i]}_3.bin
							j=`expr $j+1`
						done
							i=`expr $i+1`
					done
													
				done
			done
		done 
	done
else  
	echo "ALI_SAO_${array[$i]},$SaoLumaOffsetBitShift,$SaoChromaOffsetBitShift,$SAO,$TestSAODisableAtPictureLevel,$SaoEncodingRate,$SaoEncodingRateChroma,$MaxNumOffsetsPerPic,$SAOLcuBoundary,$SAOResetEncoderStateAfterIRAP">>$output_sliceSegment
	for s in SlideShow Console Desktop FlyingGraphics Map Programing Robot WebBrowsing WordEditing
	do
		j=0
		#encoder_randomaccess_main_scc encoder_lowdelay_main_scc encoder_lowdelayp_main_scc
		for cfg in encoder_intra_main_scc
		do	
			./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=0 --IntraBlockCopyEnabled=0 --PaletteMode=0 -b ${dir}/ALI_SAO_ai_${jarray[$j]}_${s}_${array[$i]}_0.bin 										
			./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=0 --IntraBlockCopyEnabled=1 --PaletteMode=0 -b ${dir}/ALI_SAO_ai_${jarray[$j]}_${s}_${array[$i]}_1.bin
			./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=0 --IntraBlockCopyEnabled=0 --PaletteMode=1 -b ${dir}/ALI_SAO_ai_${jarray[$j]}_${s}_${array[$i]}_2.bin
			./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=0 --IntraBlockCopyEnabled=1 --PaletteMode=1 -b ${dir}/ALI_SAO_ai_${jarray[$j]}_${s}_${array[$i]}_3.bin
			j=`expr $j+1`
		done
		i=`expr $i+1`
	done		

	
								
								
								
								
								
								
								
								
								
								
					    
    
		 
		 
