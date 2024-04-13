cd_into_env(){
    buildin cd "@"
    # check if .python-version exists in current dir
    # if exists, read venv name

    # check if no virtual env is active
        # activate venv read from .python-version

    # if virtual env is active
        # deactivate current env
        # activate venv read from .python-version
}