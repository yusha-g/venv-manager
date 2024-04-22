cd(){
    # TODO: there's a lot of redundant code. come up with a way to fix it. 
    builtin cd "$@"
    # check if .python-version exists in current dir
    # if exists, read venv name
    if [ -e .python-version ] ; then
        # save dir of .python-version
        parent_dir=$PWD
        env_name="`cat .python-version`"
        env_path=~/venv-manager/my_venvs/$env_name
        # check if no virtual env is active
        if [ -z "$VIRTUAL_ENV" ] ; then
            # activate venv read from .python-version
            if [ -d $env_path ] ; then
                source $env_path/bin/activate
            fi
        fi
    else
        if [ ! -z "$VIRTUAL_ENV" ] ; then
            # if virtul_env is active, check if folder is a subdir of original virtual_env
            # if yes then do nothing
            # else deactivate
            if [[ "$PWD"/ != "$parentdir"/* ]] ; then
                deactivate
            fi
        fi
    fi
}