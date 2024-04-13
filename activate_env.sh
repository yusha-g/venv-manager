activate_if_env_exists(){
    if [ -d ./my_venvs/$1 ] ; then
        #activate
        echo "env $1 found"
    fi
}

activate_env(){
    # check if no virtual env is active
    if [[ -z "$VIRTUAL_ENV" ]] ; then
        # if .python-version is present read venv name and activate
        if [ -e .python-version ] ; then
            env_name="`cat .python-version`"
            activate_if_env_exists $env_name
        
        # else ask for name of env to activate
        else
            echo "No .python-env found"
            read -p "Enter name of virtual environment to activate: " env_name
            activate_if_env_exists $env_name
        fi

    # if virtual env is active
    # give message and ask to deactivate first
    else
        echo "$VIRTUAL_ENV already active"
    fi
}
activate_env