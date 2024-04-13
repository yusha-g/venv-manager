create_env(){
    # input virtual env name -- default: .venv
    read -p "Enter virtual environment name (optional, default: .venv): " env_name
    if [ -z $virtual_env ] ; then
        env_name=".venv"
    fi

    # check if virtual env with same name exists
    if [ -d ./my_venvs/$env_name ] ; then
        echo "Environment Already Exists"
    else
        # create a .python-version in currect folder
        # write venv name in .python-version
        touch .python-version
        echo $env_name > .python-version

        # in my_venvs create venv with provided name
        python3 -m venv  my_venvs/$env_name

        # [optional] create symlink to venv
    fi
}
create_env