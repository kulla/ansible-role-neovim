neovim
======

Installs and configures the text editor [neovim](https://neovim.io/).

Example Playbook
----------------

```yaml
- hosts: localhost
  roles:
     - neovim
  vars:
    neovim_user_id: myusername

    neovim_configuration: |
      set number
      set tabstop=4
      set shiftwidth=4

    neovim_plugins:
      - HerringtonDarkholme/yats.vim
      - name: mhartington/nvim-typescript
        options:
          do: ./install.sh
```

Role Variables
--------------

The variables for configuring this role are:

```yaml
# Name of the user for whom neovim shall be configured
# (This value defaults to the value "ansible_user_id")
neovim_user_id: ...

# Configuration of neovim (content of "init.vim")
neovim_configuration: |
  ...

# List of neovim plugins which shall be installed
neovim_plugins:
  - ...
```

`neovim_configuration`: The neovim configuration can be read from a file using the [file lookup plugin](https://docs.ansible.com/ansible/latest/plugins/lookup/file.html) or from a template with the [template lookup plugin](https://docs.ansible.com/ansible/latest/plugins/lookup/template.html):

```yaml
neovim_configuration: "{{ lookup('file', 'my_neovim_configuration.vim') }}"
```

`neovim_plugins`: When this list is not empty, [vim-plug](https://github.com/junegunn/vim-plug) is installed and the necessary configuration for vim-plug is added.
Each item of this list is either a string and contains the name of the plugin or is an dictionary of the form `{ name: ..., options: ... }` containing the name of the plugin and additional options.
The options are the same as the [options vim-plug offers](https://github.com/junegunn/vim-plug#plug-options).
*Note:* Currently only options are supported which does not contain the characters `"` or `'`.

You can find more variables for a more specialized configuration in [`defaults/main.yml`](defaults/main.yml).
However, these variables might change in the future since they aren't considered part of the officially supported variables.

Dependencies and Requirements
-----------------------------

This role has no dependencies or requirements.

License
-------

To the extent possible under law, I waive all copyright and related or neighboring rights to this software stored under [https://github.com/kulla/ansible-role-taskwarrior](https://github.com/kulla/ansible-role-taskwarrior).
Thus, I publish this software under the [CC0 1.0 Universal (CC0 1.0) Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/deed.en). This software is published from Germany.

Author Information
------------------

The main author is [Stephan Kulla](http://kulla.me/).
