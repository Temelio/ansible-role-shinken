# shinken

[![Build Status](https://travis-ci.org/Temelio/ansible-role-shinken.svg?branch=master)](https://travis-ci.org/Temelio/ansible-role-shinken)

Install shinken package.

**Clean default package configuration, except daemons.**
All objects can be defined, using Shinken configuration structures.

**No configuration checks are added with this role, it's the Shinken arbiter job**

## Requirements

This role requires Ansible 2.0 or higher,
and platform requirements are listed in the metadata file.

## Testing

This role contains two tests methods :
- locally using Vagrant
- automatically with Travis **Not working due to paths used by Travis box :/**

### Testing dependencies
- install [Vagrant](https://www.vagrantup.com)
- install [Vagrant serverspec plugin](https://github.com/jvoorhis/vagrant-serverspec)
    $ vagrant plugin install vagrant-serverspec
- install ruby dependencies
    $ bundle install

### Running tests

#### Run playbook and test

- if Vagrant box not running
    > $ vagrant up

- if Vagrant box running
    > $ vagrant provision

## How ...

Before using this role, you should read the [the vars file used by tests](./tests/test_vars.yml) file, and
[the default files](./defaults/main.yml) to check all needed examples.

### Configure daemons (.ini)

The **shinken_daemon_defaults** contains the base settings for all daemons,
and they can be overloaded with specific daemon settings, with these vars :
* shinken_brokerd
* shinken_pollerd
* shinken_reactionnerd
* shinken_receiverd
* shinken_schedulerd

### Define objects

All objects are defined by a dictionnaries list, using shinken keys names.
You can find examples in [the vars file used by tests](./tests/test_vars).
Daemon definitions are in [the default files](./defaults/main.yml).

Some exeptions, escalations and dependencies have **escalation_name** and
**dependency_name** additional keys to manage their file name.

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
         - { role: achaussier.shinken }

## License

MIT

## Author Information

Alexandre Chaussier (for Temelio company)
- http://temelio.com
- alexandre.chaussier [at] temelio.com

