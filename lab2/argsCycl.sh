echo you have entered $# arguments
for I in $@
do
	echo $I
done
echo \n\n
for i in {100..104}; do
	echo $i
done
for file in *
do
	echo $file
	if [ -f "$file" ]; then
		echo "$file is file"
	fi
done
