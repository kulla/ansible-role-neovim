neovim
======

Installs and configures the text editor [neovim](https://neovim.io/).

Role Variables
--------------

The variables for configuring this role are:

```yaml
# User for whom neovim shall be configured
# (This value defaults to the value "ansible_user_id")
neovim_user_id: ...

# Configuration of neovim (content of "init.vim")
neovim_configuration: |
  ...
```

You can find more variables for a more specialized configuration in [`defaults/main.yml`](defaults/main.yml). However, these variables might change in the future since they aren't considered part of the officially supported variables.

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
```

The neovim configuration can also be read from a file using the [file lookup plugin](https://docs.ansible.com/ansible/latest/plugins/lookup/file.html) or from a template with the [template lookup plugin](https://docs.ansible.com/ansible/latest/plugins/lookup/template.html):

```yaml
neovim_configuration: "{{ lookup('file', 'my_neovim_configuration.vim') }}"
```

Dependencies and Requirements
-----------------------------

This role has no dependencies or requirements.

License
-------

To the extent possible under law, I waive all copyright and related or neighboring rights to this software stored under [https://github.com/kulla/ansible-role-taskwarrior](https://github.com/kulla/ansible-role-taskwarrior). Thus, I publish this software under the [CC0 1.0 Universal (CC0 1.0) Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/deed.en). This software is published from Germany.

Author Information
------------------

The main author is [Stephan Kulla](http://kulla.me/).
