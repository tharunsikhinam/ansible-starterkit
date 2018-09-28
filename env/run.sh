DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $DIR/..
pwd

host=env/$1/hosts
help_run()
{
 echo "keep 1st arg as stage or production"
 echo "app-setup is for running hrms-setup.yml"
 echo "run-app is for running hrms-app.yml"

#add file names in above echo statements where ever missing
 echo "Select one OR more options from above list"
}

if [ $# -eq 0 ]
 then
   help_run
fi

#shift 1st arg
shift

for opt in $@
 do
   case $opt in

     example)                                     echo -e "starting setup job:-\n"
                                                  ansible-playbook -vvvv example-role.yml -i $host || exit 1;;

     *)                                           echo -e "Nothing to run here.Run command in the form:-\n $(help_run)" ;;
   esac
 done
