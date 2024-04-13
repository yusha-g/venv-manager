activate_env(){
    # check if no virtual env is active
    if [[ -z "$VIRTUAL_ENV" ]] ; then
        # if .python-version is present read venv name and activate
        
        # else ask for name of env to activate

    # if virtual env is active
    # give message and ask to deactivate first
    else
        echo "$VIRTUAL_ENV already active"
    fi
}