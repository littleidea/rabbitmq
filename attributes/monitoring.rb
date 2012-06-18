# service commands for monit
# /usr/sbin/service rabbitmq start/stop work on both fedora and ubuntu
# if support is needed on another platform, add the case

default[:rabbitmq][:platform] =
  case platform
  when nil
  else
    { "monit_commands" =>
      { "rabbitmq-server" =>
        { "start" => "/usr/sbin/service rabbitmq-server start",
          "stop" => "/usr/sbin/service rabbitmq-server stop"
        }
      }
    }
  end

