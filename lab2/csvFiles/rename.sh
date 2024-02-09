for file in *.csv
do
	mv $file  snapshot_$(date +%m)_${file#snapshot_}
done
