#!/bin/bash

output_tile="tile.csv"
echo "FILE,TileUniformSpacing,NumTileColumnsMinus1,NumTileRowsMinus1,TileColumnWidthArray,TileRowHeightArray,LFCrossTileBoundaryFlag" > $output_tile
array=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
jarray=(ai ra lb lp)
#sequence=(SlideShow Console Desktop FlyingGraphics Map Programming Robot WebBrowsing WordEditing)
TileColumnWidthArray=(8 4 2)
TileRowHeightArray=(8 4 2)
i=0
f=30
dir=tile
mkdir ${dir}
for TileUniformSpacing in 0 1
do
	for LFCrossTileBoundaryFlag in 0 1
	do
		if [ $TileUniformSpacing == 1 ]; then
			for NumTileColumnsMinus1 in 0 1 2 3
			do
				for NumTileRowsMinus1 in 0 1 2 3
				do 
					echo "ALI_TILE_${array[$i]} , $NumTileColumnsMinus1 , $NumTileRowsMinus1 , default , default , $LFCrossTileBoundaryFlag"  >> $output_tile
					for s in SlideShow Console Desktop FlyingGraphics Map Programming Robot WebBrowsing WordEditing
					do
						j=0
					    	#encoder_randomaccess_main_scc encoder_lowdelay_main_scc encoder_lowdelayp_main_scc
					    	for cfg in encoder_intra_main_scc
					    	do
							./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f  --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --IntraBlockCopyEnabled=0 --PaletteMode=0 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_0.bin
							./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f  --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --IntraBlockCopyEnabled=1 --PaletteMode=0 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_1.bin
							./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f  --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --IntraBlockCopyEnabled=0 --PaletteMode=1 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_2.bin
							./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f  --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --IntraBlockCopyEnabled=1 --PaletteMode=1 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_3.bin
						j=`expr $j + 1`
						done
					done
					i=`expr $i + 1`
				done
			done
		else
			for NumTileColumnsMinus1 in 1 2 3
			do
				for NumTileRowsMinus1 in 1 2 3
				do 
					echo "ALI_TILE_${array[$i]} , $NumTileColumnsMinus1 , $NumTileRowsMinus1 , ${TileColumnWidthArray[$NumTileColumnsMinus1]} , ${TileRowHeightArray[$NumTileRowsMinus1]} , $LFCrossTileBoundaryFlag"  >> $output_tile
					for s in SlideShow Console Desktop FlyingGraphics Map Programming Robot WebBrowsing WordEditing
					do
						j=0
					    	#encoder_randomaccess_main_scc encoder_lowdelay_main_scc encoder_lowdelayp_main_scc
					    	for cfg in encoder_intra_main_scc
					    	do
							./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f  --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --TileColumnWidthArray=${TileColumnWidthArray[@]:0:$NumTileColumnsMinus1} --TileRowHeightArray=${TileRowHeightArray[@]:0:$NumTileRowsMinus1} --IntraBlockCopyEnabled=0 --PaletteMode=0 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_0.bin
							./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f  --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --TileColumnWidthArray=${TileColumnWidthArray[@]:0:$NumTileColumnsMinus1} --TileRowHeightArray=${TileRowHeightArray[@]:0:$NumTileRowsMinus1} --IntraBlockCopyEnabled=1 --PaletteMode=0 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_1.bin
							./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f  --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --TileColumnWidthArray=${TileColumnWidthArray[@]:0:$NumTileColumnsMinus1} --TileRowHeightArray=${TileRowHeightArray[@]:0:$NumTileRowsMinus1} --IntraBlockCopyEnabled=0 --PaletteMode=1 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_2.bin
							./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f  --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --TileColumnWidthArray=${TileColumnWidthArray[@]:0:$NumTileColumnsMinus1} --TileRowHeightArray=${TileRowHeightArray[@]:0:$NumTileRowsMinus1} --IntraBlockCopyEnabled=1 --PaletteMode=1 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_3.bin
						j=`expr $j + 1`
						done
					done
					i=`expr $i + 1`
				done
			done
		fi
	done
done


#./TAppEncoder -c encoder_randomaccess_main_scc.cfg -c SlideShow_444.cfg --Log2ParallelMergeLevel= -b ALI_MERGE_G.bin
