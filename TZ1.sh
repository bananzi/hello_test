#!/bin/bash

copy(){

if [ -f $1 ];then
	find -name $1 -print0 | while IFS= read -r -d '' path
	do
		patht=$path
		suf=${patht##*.}
		suf2=${suf##*/}
		if [ $suf == $suf2 ]; then
    			base=$(basename --suffix=".$suf" "$path")
	    		new_path=$output/"$base"$counter".$suf"
    			cp "$path" "$new_path"
    			counter="("$(( $counter +1 ))")"
		else
			base=$(basename "$path")
                        new_path=$output/"$base"$counter
                        cp "$path" "$new_path"
                        counter="("$(( $counter +1 ))")"
		fi

	done


else
	cd $1
	for filename in *; do
		copy $filename
	done
	cd ../
fi

}
input=$1
output=$2
cd $input

for filename1 in *; do
	copy $filename1
done
