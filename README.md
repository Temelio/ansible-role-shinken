# shinken

[![Build Status](https://travis-ci.org/Temelio/ansible-role-shinken.svg?branch=master)](https://travis-ci.org/Temelio/ansible-role-shinken)

Install shinken package.

## Requirements

This role requires Ansible 2.0 or higher,
and platform requirements are listed in the metadata file.

## Testing

This role contains two tests methods :
- locally using Vagrant
- automatically with Travis

### Testing dependencies
- install [Vagrant](https://www.vagrantup.com)
- install [Vagrant serverspec plugin](https://github.com/jvoorhis/vagrant-serverspec)
    $ vagrant plugin install vagrant-serverspec
- install ruby dependencies
    $ bundle install

### Running tests

#### Run playbook and test

- if Vagrant box not running
    $ vagrant up

- if Vagrant box running
    $ vagrant provision

## Role Variables

### Default role variables

    # Shinken general settings
    shinken_system_dependencies_state: present
    shinken_pip_package_name: 'shinken'
    shinken_pip_package_state: 'present'
    shinken_pip_package_version: '2.4.2'

    # Shinken user settings
    shinken_user_group: 'shinken'
    shinken_user_home: '/var/lib/shinken'
    shinken_user_name: 'shinken'
    shinken_user_password: 'shinken'
    shinken_user_shell: '/bin/bash'
    shinken_user_update_password: 'always'

    # Daemons
    shinken_daemons:
      arbiter:
        debug: False
        enabled: True
        started: True
      broker:
        debug: False
        enabled: True
        started: True
      poller:
        debug: False
        enabled: True
        started: True
      reactionner:
        debug: False
        enabled: True
        started: True
      receiver:
        debug: False
        enabled: True
        started: True
      scheduler:
        debug: False
        enabled: True
        started: True

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

