path = Dir.pwd + "/tmp/puma/"

threads 0,20
environment "production"
daemonize true
drain_on_shutdown true

pidfile path + "pid/puma.pid"
state_path path + "pid/puma.state"

bind  "unix://" + path + "socket/puma.sock" # bind needs to be set at the end for logging reasons?
