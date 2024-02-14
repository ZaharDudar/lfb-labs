period=300
n_saves=5
last_backup=$(date +%s)

while getopts p:n: flag
do
    case "${flag}" in
        p) period=${OPTARG};;
        n) n_saves=${OPTARG};;
    esac
done
if [[ $period == *'m'* ]];then
    ((period=${period%m}*60))
fi

# echo $period

if ! test -d ${PWD}/backups;then
    mkdir ${PWD}/backups
fi
while true;do  
    if (($(date +%s) - last_backup >= period)); then
        last_backup=$(date +%s)
        # echo $(( $(ls ${PWD}/backups | wc -l) >= n_saves ))
        while (( $(ls ${PWD}/backups | wc -l) >= n_saves )); 
        do
            dir=$(find ${PWD}/backups/ -maxdepth 1 -type d -printf '%T+ %p\n' -not -path "${PWD}/backups/." | sort | head -n 1)
            # echo /${dir#*/}
            rm -f -r /${dir#*/} > /dev/null
            # echo $(ls ${PWD}/backups | wc -l)
        done
        rsync -av --exclude="backups/" ${PWD}/ ${PWD}/backups/backup_$(date +"%d-%m-%4YT%H-%M-%S") > /dev/null
    fi
done
