# venv manager

Created in an effort to simplify the management of venvs by providing a pyenv-like workflow for creation, activation, auto-activation and auto-deactivation based on project directory. 

---

## TOC

[code structure](https://github.com/yusha-g/venv-manager?tab=readme-ov-file#create_env)

[setup](https://github.com/yusha-g/venv-manager?tab=readme-ov-file#setting-up-the-scripts-in-your-system)

[identified drawbacks](https://github.com/yusha-g/venv-manager?tab=readme-ov-file#identified-drawbacks)

[future plans](https://github.com/yusha-g/venv-manager?tab=readme-ov-file#future-additions-that-may-or-may-not-materialize)

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

### cd_into_env 
[needs to be improved]
- check if `.python-version` exists in current directory.
    - if exists:
        - read venv name
        - check that no virtual env is active.
            - if not active: activate venv in `.python-version`
    - else: 
        - checks if virtual env is active and current directory is subdirectory. 
        - if not : deactivate current env.

# setting up the scripts in your system
## OS X
- Goto folder User/{username}
    - go > go to folder > type: `~` and hit go
- in .bash_profile add the following:
```bash
source ~/venv-manager/create_env.sh
source ~/venv-manager/activate_env.sh
source ~/venv-manager/cd_into_env.sh
```
- refresh terminal and it should be working
# identified drawbacks

- auto-activate and deactivate only works if you `cd` in and out of the directory. 
It will not work if you directly open a terminal inside the directory.
- auto-activate and deactivate will not work if you `cd` from one directory with `.python-version` to another. 
```bash
For the following file structure
|- dir_1
    |- .python-version > trial-1
|- dir_2
    |- .python-version > trial-2

Directly cd-ing from dir_1 to dir_2 will not change active env

(trial-1)...:dir_1$ cd ../dir_2
(trial-1)...:dir_2$

```

# future additions that may or may not materialize

- create symlink for venvs in the directories.