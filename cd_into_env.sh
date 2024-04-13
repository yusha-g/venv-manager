cd_into_env(){
    buildin cd "@"
    # check if .python-version exists in current dir
    # if exists, read venv name
    if [ -e .python-version ] ; then
        env_name="`cat .python-version`"
        env_path=my_venvs/$env_name
        # check if no virtual env is active
        if [ -z "$VIRTUAL_ENV" ] ; then
            # activate venv read from .python-version
            if [ -d $env_path ] ; then
                source $env_path/bin/activate
            fi
        else
            # if virtul_env is active, check if folder is a subdir of original virtual_env
            # if yes then do nothing
            # else deactivate
            parentdir="$(dirname "$VIRTUAL_ENV")"
            if [[ "$PWD"/ != "$parentdir"/* ]] ; then
                deactivate
            fi
        fi
    fi
}