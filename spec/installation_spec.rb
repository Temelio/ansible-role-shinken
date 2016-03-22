require 'serverspec'

if ENV['TRAVIS']
    set :backend, :exec
end

describe 'shinken Ansible role installation' do

    # Define variables
    directories = Array[]
    packages = Array[]

    if ['debian', 'ubuntu'].include?(os[:family])
        directories = Array[ '/etc/shinken',
                             '/var/lib/shinken/cli',
                             '/var/lib/shinken/doc',
                             '/var/lib/shinken/inventory',
                             '/var/lib/shinken/libexec',
                             '/var/lib/shinken/modules',
                             '/var/lib/shinken/share' ]

        packages = Array[ 'apt', 'nagios-plugins',
                          'python-pip', 'python-pycurl',
                          'python-setuptools' ]
    end

    it 'install role packages' do
        packages.each do |pkg_name|
            expect(package(pkg_name)).to be_installed
        end
    end

    describe user('shinken') do
        it { should exist }
        it { should belong_to_group 'shinken' }
        it { should have_home_directory '/var/lib/shinken' }
        it { should have_login_shell '/bin/bash' }
    end

    describe command('pip list') do
        its(:stdout) { should match /Shinken \(2.4.3\)/ }
    end

    it 'create Shinken structure' do
        directories.each do |dir_name|
            expect(file(dir_name)).to exist
            expect(file(dir_name)).to be_directory
        end
    end

    it 'configure daemon startup' do
        services = Array[ 'shinken-arbiter', 'shinken-broker',
                          'shinken-poller', 'shinken-reactionner',
                          'shinken-receiver', 'shinken-scheduler' ]

        services.each do |service_name|
            expect(service(service_name)).to be_enabled
        end
    end
end

