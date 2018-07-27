# shinken

[![Build Status](https://travis-ci.org/Temelio/ansible-role-shinken.svg?branch=master)](https://travis-ci.org/Temelio/ansible-role-shinken)

Install shinken package.

**Clean default package configuration, except daemons.**
All objects can be defined, using Shinken configuration structures.

**No configuration checks are added with this role, it's the Shinken arbiter job**

## Requirements

This role requires Ansible 2.4,
and platform requirements are listed in the metadata file.

## Testing

This role use [Molecule](https://github.com/metacloud/molecule/) to run tests.

Local and Travis tests run tests on Docker by default.
See molecule documentation to use other backend.

Currently, tests are done on:
- Ubuntu Xenial

and use:
- Ansible 2.4.x
- Ansible 2.5.x

### Running tests

#### Using Docker driver

```
$ tox
```


### Install modules or packs

You can manage pack or module installation, from shinken.io or a git repository
if you want. Variables are **shinken_modules** and **shinken_packs**.

    shinken_packs:
      - name: 'linux-snmp'
        method: 'shinken_io'
      - name: 'pack-linux-ssh'
        method: 'custom_git'
        install:
          repo: 'https://github.com/Temelio/pack-linux-ssh.git'
          version: 'waiting_pr'

## Role Variables

### Default role variables

Too many, see [the default files](./defaults/main.yml).

### Specific ubuntu variables

    shinken_system_dependencies:
      - nagios-plugins
      - python-pip
      - python-pycurl
      - python-setuptools

## Dependencies

None

## Example Playbook

    - hosts: servers
      roles:
         - { role: Temelio.shinken }

## License

MIT

## Author Information

Alexandre Chaussier - Lise Machetel (for Temelio company)
- https://temelio.com
- lise.machetel [at] temelio.com

