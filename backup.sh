source ./backup_restore_lib.sh

s= $1
d= $2
k=$3
date=$(date | sed s/\ /_/g | sed s/\:/_/g)

validate_backup_params $s $d

cd $d 
mkdir $date
cd $date

backup $s $k
