output_tile="tile&sao.csv"
echo "FILE;SAO,SaoEncodingRate,SaoEncodingRateChroma,SAOLcuBoundary,TileUniformSpacing;NumTileColumnsMinus1;NumTileRowsMinus1;TileColumnWidthArray;TileRowHeightArray;LFCrossTileBoundaryFlag" > $output_tile
array=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z AA AB AC AD AE AF AG AH AI AJ AK AL AM AN AO AP AQ AR AS AT AU AV AW AX AY AZ BA BB BC BD BE BF BG BH BI BJ BK BL BM BN BO BP BQ BR BS BT BU BV BW BX BY BZ CA CB CC CD CE CF CG CH CI CJ CK CL CM CN CO CP CQ CR CS CT CU CV CW CX CY CZ DA DB DC DD DE DF DG DH DI DJ DK DL DM DN DO DP DQ DR DS DT DU DV DW DX DY DZ)
jarray=(ai ra lb lp)
#sequence=(SlideShow Console Desktop FlyingGraphics Map Programming Robot WebBrowsing WordEditing)
TileColumnWidthArray=('8' '8,4' '8,4,2')
TileRowHeightArray=('8' '8,2' '4,4,2')
i=0
f=30
dir=tile&sao
mkdir ${dir}
if [$SAO==1] ;then
    for SaoEncodingRate in -1 0.75
	do
	    for SaoEncodingRateChroma in -1 0.5
		do
		    for SAOLcuBoundary in 0 1
			do
				for TileUniformSpacing in 0 1
				do
					for LFCrossTileBoundaryFlag in 0 1
					do
						if [ $TileUniformSpacing == 1 ]; then
							for NumTileColumnsMinus1 in  1 2 
							do
								for NumTileRowsMinus1 in  1 2 
								do 
									echo "ALI_TILE_${array[$i]} ; $TileUniformSpacing ; $NumTileColumnsMinus1 ; $NumTileRowsMinus1 ; default ; default ; $LFCrossTileBoundaryFlag"  >> $output_tile
									for s in SlideShow Console Desktop FlyingGraphics Map Programming Robot WebBrowsing WordEditing
									do
										j=0
											#encoder_randomaccess_main_scc encoder_lowdelay_main_scc encoder_lowdelayp_main_scc
											for cfg in encoder_intra_main_scc
											do
											./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=1 --SaoEncodingRate=$SaoEncodingRate --SaoEncodingRateChroma=$SaoEncodingRateChroma --SAOLcuBoundary=$SAOLcuBoundary --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --IntraBlockCopyEnabled=0 --PaletteMode=0 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_0.bin
											./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=1 --SaoEncodingRate=$SaoEncodingRate --SaoEncodingRateChroma=$SaoEncodingRateChroma --SAOLcuBoundary=$SAOLcuBoundary --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --IntraBlockCopyEnabled=1 --PaletteMode=0 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_1.bin
											./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=1 --SaoEncodingRate=$SaoEncodingRate --SaoEncodingRateChroma=$SaoEncodingRateChroma --SAOLcuBoundary=$SAOLcuBoundary --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --IntraBlockCopyEnabled=0 --PaletteMode=1 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_2.bin
											./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=1 --SaoEncodingRate=$SaoEncodingRate --SaoEncodingRateChroma=$SaoEncodingRateChroma --SAOLcuBoundary=$SAOLcuBoundary --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1  --IntraBlockCopyEnabled=1 --PaletteMode=1 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_3.bin
										j=`expr $j + 1`
										done
									done
									i=`expr $i + 1`
								done
							done
						else
							for NumTileColumnsMinus1 in 1 2 
							do
								for NumTileRowsMinus1 in 1 2 
								do 
									echo "ALI_TILE_${array[$i]} ; $TileUniformSpacing ; $NumTileColumnsMinus1 ; $NumTileRowsMinus1 ; ${TileColumnWidthArray[@]:0:$NumTileColumnsMinus1} ; ${TileRowHeightArray[@]:0:$NumTileRowsMinus1} ; $LFCrossTileBoundaryFlag"  >> $output_tile
									for s in SlideShow Console Desktop FlyingGraphics Map Programming Robot WebBrowsing WordEditing
									do
										j=0
											#encoder_randomaccess_main_scc encoder_lowdelay_main_scc encoder_lowdelayp_main_scc
											for cfg in encoder_intra_main_scc
											do
											./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=1 --SaoEncodingRate=$SaoEncodingRate --SaoEncodingRateChroma=$SaoEncodingRateChroma --SAOLcuBoundary=$SAOLcuBoundary --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --TileColumnWidthArray=${TileColumnWidthArray[`expr $NumTileColumnsMinus1 - 1`]} --TileRowHeightArray=${TileRowHeightArray[`expr $NumTileRowsMinus1 - 1`]} --IntraBlockCopyEnabled=0 --PaletteMode=0 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_0.bin
											./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=1 --SaoEncodingRate=$SaoEncodingRate --SaoEncodingRateChroma=$SaoEncodingRateChroma --SAOLcuBoundary=$SAOLcuBoundary --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --TileColumnWidthArray=${TileColumnWidthArray[`expr $NumTileColumnsMinus1 - 1`]} --TileRowHeightArray=${TileRowHeightArray[`expr $NumTileRowsMinus1 - 1`]} --IntraBlockCopyEnabled=1 --PaletteMode=0 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_1.bin
											./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=1 --SaoEncodingRate=$SaoEncodingRate --SaoEncodingRateChroma=$SaoEncodingRateChroma --SAOLcuBoundary=$SAOLcuBoundary --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --TileColumnWidthArray=${TileColumnWidthArray[`expr $NumTileColumnsMinus1 - 1`]} --TileRowHeightArray=${TileRowHeightArray[`expr $NumTileRowsMinus1 - 1`]} --IntraBlockCopyEnabled=0 --PaletteMode=1 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_2.bin
											./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=1 --SaoEncodingRate=$SaoEncodingRate --SaoEncodingRateChroma=$SaoEncodingRateChroma --SAOLcuBoundary=$SAOLcuBoundary --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --TileColumnWidthArray=${TileColumnWidthArray[`expr $NumTileColumnsMinus1 - 1`]} --TileRowHeightArray=${TileRowHeightArray[`expr $NumTileRowsMinus1 - 1`]} --IntraBlockCopyEnabled=1 --PaletteMode=1 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_3.bin
										j=`expr $j + 1`
										done
									done
									i=`expr $i + 1`
								done
							done
						fi
					done
				done
			done	
		done	
    done
else
    for TileUniformSpacing in 0 1
	do
		for LFCrossTileBoundaryFlag in 0 1
		do
			if [ $TileUniformSpacing == 1 ]; then
				for NumTileColumnsMinus1 in  1 2 
				do
					for NumTileRowsMinus1 in  1 2 
					do 
						echo "ALI_TILE_${array[$i]} ; $TileUniformSpacing ; $NumTileColumnsMinus1 ; $NumTileRowsMinus1 ; default ; default ; $LFCrossTileBoundaryFlag"  >> $output_tile
						for s in SlideShow Console Desktop FlyingGraphics Map Programming Robot WebBrowsing WordEditing
						do
							j=0
								#encoder_randomaccess_main_scc encoder_lowdelay_main_scc encoder_lowdelayp_main_scc
								for cfg in encoder_intra_main_scc
								do
								./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=0 --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --IntraBlockCopyEnabled=0 --PaletteMode=0 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_0.bin
								./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=0 --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --IntraBlockCopyEnabled=1 --PaletteMode=0 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_1.bin
								./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=0 --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --IntraBlockCopyEnabled=0 --PaletteMode=1 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_2.bin
								./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f --SAO=0 --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1  --IntraBlockCopyEnabled=1 --PaletteMode=1 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_3.bin
							j=`expr $j + 1`
							done
						done
						i=`expr $i + 1`
					done
				done
			else
				for NumTileColumnsMinus1 in 1 2 
				do
					for NumTileRowsMinus1 in 1 2 
					do 
						echo "ALI_TILE_${array[$i]} ; $TileUniformSpacing ; $NumTileColumnsMinus1 ; $NumTileRowsMinus1 ; ${TileColumnWidthArray[@]:0:$NumTileColumnsMinus1} ; ${TileRowHeightArray[@]:0:$NumTileRowsMinus1} ; $LFCrossTileBoundaryFlag"  >> $output_tile
						for s in SlideShow Console Desktop FlyingGraphics Map Programming Robot WebBrowsing WordEditing
						do
							j=0
								#encoder_randomaccess_main_scc encoder_lowdelay_main_scc encoder_lowdelayp_main_scc
								for cfg in encoder_intra_main_scc
								do
								./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f  --SAO=0 --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --TileColumnWidthArray=${TileColumnWidthArray[`expr $NumTileColumnsMinus1 - 1`]} --TileRowHeightArray=${TileRowHeightArray[`expr $NumTileRowsMinus1 - 1`]} --IntraBlockCopyEnabled=0 --PaletteMode=0 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_0.bin
								./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f  --SAO=0 --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --TileColumnWidthArray=${TileColumnWidthArray[`expr $NumTileColumnsMinus1 - 1`]} --TileRowHeightArray=${TileRowHeightArray[`expr $NumTileRowsMinus1 - 1`]} --IntraBlockCopyEnabled=1 --PaletteMode=0 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_1.bin
								./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f  --SAO=0 --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --TileColumnWidthArray=${TileColumnWidthArray[`expr $NumTileColumnsMinus1 - 1`]} --TileRowHeightArray=${TileRowHeightArray[`expr $NumTileRowsMinus1 - 1`]} --IntraBlockCopyEnabled=0 --PaletteMode=1 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_2.bin
								./TAppEncoderStatic -c $cfg.cfg -c persequence/${s}_444.cfg --FramesToBeEncoded=$f  --SAO=0 --LFCrossTileBoundaryFlag=$LFCrossTileBoundaryFlag --TileUniformSpacing=$TileUniformSpacing --NumTileColumnsMinus1=$NumTileColumnsMinus1 --NumTileRowsMinus1=$NumTileRowsMinus1 --TileColumnWidthArray=${TileColumnWidthArray[`expr $NumTileColumnsMinus1 - 1`]} --TileRowHeightArray=${TileRowHeightArray[`expr $NumTileRowsMinus1 - 1`]} --IntraBlockCopyEnabled=1 --PaletteMode=1 -b ${dir}/ALI_TILE_ai_${jarray[$j]}_${s}_${array[$i]}_3.bin
							j=`expr $j + 1`
							done
						done
						i=`expr $i + 1`
					done
				done
			fi
		done
	done	
