function cstm_unzip() {
	#!/bin/sh
	#unzip all zip files under curr dir.
	for zip in *.zip; do
		dirname=$(echo $zip | sed 's/\.zip$//')
		if mkdir "$dirname"; then
			if cd "$dirname"; then
				unzip ../"$zip"
				cd ..
				# rm -f $zip # Uncomment to delete the original zip file
			else
				echo "Could not unpack $zip - cd failed"
			fi
		else
			echo "Could not unpack $zip - mkdir failed"
		fi
	done
}

function cstm_unzip_desig() {
	#!/bin/sh
	#unzip all zip files under curr dir under designated dir
	while [ -n "$1" ]; do # while loop starts
		case "$1" in
		-o)
			dirname=$2
			echo "unzip under $dirname"
			;; # Message for -a option
		esac
		shift
	done

	if [ -z ${dirname+x} ]; then
		dirname=$(pwd)
		echo "unzip under $dirname"
 fi

  zips=$(ls *.zip)
  echo "unpack $zips"
	for zip in *.zip; do
		if mkdir "$dirname"; then
			if cd "$dirname"; then
				unzip ../"$zip"
				cd ..
				# rm -f $zip # Uncomment to delete the original zip file
			else
				echo "Could not unpack $zip - cd failed"
			fi
		else
			echo "Could not unpack $zip - mkdir failed"
		fi
	done
}
