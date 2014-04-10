path = Dir.pwd + "/tmp/puma/"

threads 0,20
environment "production"
daemonize true
drain_on_shutdown true

# _load_from path

bind  "unix://" + path + "socket/puma.sock"
pidfile path + "pid/puma.pid"
state_path path + "pid/puma.state"