#!/bin/bash                                                                                       
# ex: addsubtilemkv.sh myvideofromthebus.mkv sub/myvideofromthebus.srt video
# ex: output a new file in the same folder 
# ex: with the name myvideo.VOSTFRfromthebus.mkv 
# ex: and an encode information set to "fre"
# ex: .srt file will be moved in the folder sub/inserted/
# params:
# (needed)$1 = original filename video - blabla.mkv                                               
# (needed)$2 = filename with subtitle to add - blabla.srt                                                 
# (needed)$3 = string to replace - .mkv                                                                   
# $4 = string for replace - srt.mkv                                                               
# $5 = folder for output file                                                                     
# $6 = folder to move srt                                                    
# $7 = char encode (ie : fre , eng)                                                                                                                 
# take care to not remove filename extension                                                                                                                   
                                                                                                  
if [[ -z "$4" ]]; then                                                                            
DATA4=$3.VOSTFR                                                                                   
else                                                                                              
DATA4="$4"                                                                                        
fi                                                                                                
echo $DATA4                                                                                       
                                                                                                  
if [[ -z "$5" ]]; then                                                                            
DATA5=""                                                                                          
else                                                                                              
DATA5=$5                                                                                          
fi                                                                                                
                                                                                                  
if [[ -z "$6" ]]; then                                                                            
DATA6=sub/inserted/                                                                               
else                                                                                              
DATA6=$6                                                                                          
fi                                                                                                
                                                                                                  
if [[ -z "$7" ]]; then                                                                            
DATA7=fre                                                                                         
else                                                                                              
DATA7=$7                                                                                          
fi                                                                                                
                                                                                                  
finalename=$DATA5"${1/$3/$DATA4}"                                                                 
ffmpeg -v 32 -i "$1" -f srt -i "$2" -c:v copy -c:a copy -map 0 -map_metadata 0 -map 1 -c:s srt -metadata:s:s:1 language=$DATA7 "$finalename" && mv "$2" "$DATA6"
