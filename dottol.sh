#!/bin/bash

items=( 
    ".bashrc.ava.sh $HOME/.bashrc.ava.sh"
    # nvim stuff
    "nvim/plug.vim $HOME/.local/share/nvim/site/autoload/plug.vim" 
    "nvim/init.vim $HOME/.config/nvim/init.vim"
    "nvim/_config_nvim/lua/  $HOME/.config/nvim/lua"
    "nvim/_config_nvim/after/  $HOME/.config/nvim/after"
    "nvim/nvim.appimage $HOME/.local/bin/nvim.appimage" 
    )

walk_directory() {
    local dir="$1"
    local base_dir="$2"
    local file_list=()

    # Loop through all files and directories in the current directory
    for entry in "$dir"/*; do
        if [ -d "$entry" ]; then
            # If the entry is a directory, recursively call walk_directory on it
            file_list+=($(walk_directory "$entry" "$base_dir"))
        elif [ -f "$entry" ]; then
            # If the entry is a file, add its relative path to the file_list
            local relative_path="${entry#$base_dir}"
            file_list+=("$relative_path")
        fi
    done

    # Return the file_list, file names are relative to $dir
    echo "${file_list[@]}"
}

handle_file() {
    local action=$1
    local localf=$2
    local remotef=$3
    
    # compare localf to remotef
    if [ ! -f $remotef ]; then
        diff_res=9
        diff_log="$(echo $diff_res $localf $remotef)\n"
        diff_log+=$"  - remote not found\n\n"
    elif [ ! -f $localf ]; then
        diff_res=8
        diff_log="$(echo $diff_res $localf $remotef)\n"
        diff_log+=$"  - local not found\n\n"
    else
        x=$(diff $localf $remotef)
        diff_res=$?
        diff_log="$(echo $diff_res $localf $remotef)\n"
        if [ ! $diff_res -eq 0 ]; then
            diff_log+="  $(ls -l $localf)\n"
            diff_log+="  $(ls -l $remotef)\n\n"
        fi
    fi # diff_res and diff_log are the "output" from teh ebove block
        
    if [ "$action" == "diff" ]; then 
        printf "$diff_log"
    elif [ "$action" == "dispatch" ]; then
        if [ $diff_res != 0 ]; then
            if [ $diff_res == 9 ]; then
                dirn=$(dirname $remotef)
                echo "mkdir -p $dirn"
                mkdir -p $dirn
            fi
            echo "cp $localf $remotef"
            cp $localf $remotef
        fi
    elif [ "$action" == "collect" ]; then
        if [ $diff_res != 0 ]; then
            echo "cp $remotef $localf" 
            cp $remotef $localf
        fi
    else
        echo "unrecognized action"
    fi

}

action=$1 # diff , dispatch, collect
if [ "$2" == 't' ]; then
    do_type='t'
elif [ "$2" == 'b' ]; then
    do_type='b'
else
    do_type='a'
fi


echo
for i in "${items[@]}"	
do
    ii=( ${i} ) # make a list out of the item
    local="${ii[0]}"  # local file or dir
    remote="${ii[1]}"  # "remote" file or dir

    if [ -d "$local" ]; then
        file_list=$(walk_directory "$local" "$local")
        for file in $file_list; do
            localfile=$local$file
            remotefile=$remote$file
            handle_file $action $localfile $remotefile
        done
    elif [ -f "$local" ]; then
            handle_file $action $local $remote
    fi


done 
echo
