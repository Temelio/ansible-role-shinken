require 'serverspec'

if ENV['TRAVIS']
    set :backend, :exec
end

describe 'shinken Ansible role configuration' do

    # Define variables
    shinken_group = ''
    shinken_home = ''
    shinken_path_etc = ''
    shinken_user = ''

    if ['debian', 'ubuntu'].include?(os[:family])
        shinken_group = 'shinken'
        shinken_home = '/var/lib/shinken'
        shinken_path_etc = '/etc/shinken'
        shinken_user = 'shinken'
    end

    # Shinken is initialized
    describe file("#{shinken_home}/.shinken.ini") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user  }
        it { should be_grouped_into shinken_group  }
    end

    # Main configuration file
    describe file("#{shinken_path_etc}/shinken.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user  }
        it { should be_grouped_into shinken_group  }
    end

    # Broker configuration file
    describe file("#{shinken_path_etc}/brokers/broker-master.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user  }
        it { should be_grouped_into shinken_group  }
    end

    # Scheduler configuration file
    describe file("#{shinken_path_etc}/schedulers/scheduler-master.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user  }
        it { should be_grouped_into shinken_group  }
    end

    # Contact configuration file
    describe file("#{shinken_path_etc}/contacts/admin.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user  }
        it { should be_grouped_into shinken_group  }
    end

    # Contactgroup configuration file
    describe file("#{shinken_path_etc}/contactgroups/admins.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user  }
        it { should be_grouped_into shinken_group  }
    end
end

