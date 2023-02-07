# at first install, in order for the nvim plugin system to work
items=( 
    "t nvim/plug.vim $HOME/.local/share/nvim/site/autoload/plug.vim" 
    "t nvim/init.vim $HOME/.config/nvim/init.vim"
    "t .bashrc.ava.sh $HOME/.bashrc.ava.sh"
    "b nvim/nvim.appimage $HOME/.local/bin/nvim/nvim.appimage" 
    )

action=$1
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
    ftype="${ii[0]}"  # files is text of binary
    localf="${ii[1]}"  # local file
    remotef="${ii[2]}"  # "remote" file

    if  [ "$do_type" == 'a' ] || [ "$do_type" == "$ftype" ]; then
        s=1
    else
        continue
    fi
    if [ "$action" == "diff" ]; then 
        x=$(diff $localf $remotef)
        x=$?
        echo "$x $i"
        if [ ! $x -eq 0 ]; then
           ls -l $localf 
           ls -l $remotef
           echo
        fi
    elif [ "$action" == "dispatch" ]; then
        echo "cp $localf $remotef"
        cp $localf $remotef
    elif [ "$action" == "collect" ]; then
        echo "cp $remotef $localf" 
        cp $remotef $localf
    else
        echo "unrecognized action"
    fi
done 
echo

