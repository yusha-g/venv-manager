# venv manager

Created in an effort to simplify the management of venvs by providing a pyenv-like workflow for creation, activation, auto-activation and auto-deactivation based on project directory. 

---

## TOC

[code structure](https://github.com/yusha-g/venv-manager?tab=readme-ov-file#create_env)

[identified drawbacks](https://github.com/yusha-g/venv-manager?tab=readme-ov-file#identified-drawbacks)

[future plans](https://github.com/yusha-g/venv-manager?tab=readme-ov-file#identified-drawbacks)

---

# code structure

### create_env

- Take input the name of the virtual environment to create.
- If no name is provided, consider “.venv” as the default name.
- Check if a venv with the same name exists.
    - If it does, echo out “Environment already exists”
    - Else:
        - create `.python-version` in the directory.
        - write name of virtual environment in it.
        - create venv in `my-venvs` folder.

### activate_env

- check that no virtual environment is active
    - If not activate:
        - check if `.python-version` exists.
        - If it doesn’t exist: ask for name of venv to activate.
    - Else: echo message prompting the deactivation of current venv

### autoactivate_env

- check if `.python-version` exists in current directory.
    - if exists:
        - read venv name
        - check that no virtual env is active.
            - if not active: activate venv in `.python-version`
            - else: deactivate current env and activate venv in `.python-version`.

# identified drawbacks

- auto-activate and deactivate only works if you `cd` in and out of the directory. 
It will not work if you directly open a terminal inside the directory.

# future additions that may or may not materialize

- create symlink for venvs in the directories.