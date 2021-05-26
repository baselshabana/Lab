
function validate_backup_params(){
if [[-d $1]], then
       echo "backing up the content of $1"
else
 	echo "wrong source directory name."
	^C	
fi

if [[-d $2]], then
	echo "..."
else
	echo "wrong destination directory name."
	^C
fi
}

function validate_restore_params(){
if [[-d $1]], then
       echo "restoring the content of $1"
else
 	echo "wrong source directory name."
	^C	
fi

if [[-d $2]], then
	echo "..."
else
	echo "wrong destination directory name."
	^C
fi
}

function backup(){
date=$(date | sed s/\ /_/g | sed s/\:/_/g)
for i in $1
do
	if [[-d $i]], then 
		temp= $i_$date
		tar -cvzf $temp.tgz $i
		gpg -e -r $temp.tgz $2
		rm -rf $temp.tgz
	fi
done
}

function restore(){
date= $(date | sed s/\ /_/g | sed s/\ /_/g)
for i in $1
do
	if [[-d $i]], then 
		temp= $i_$date
		gpg -d $temp.gpg $2
		tar -x $temp.tgz
		rm -rf $temp.gpg
	fi
done
}
