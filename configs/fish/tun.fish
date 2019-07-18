function tun
  set host "$argv[1]"
  set port "$argv[2]"
  ssh -nNT -L $port:localhost:$port $host
end
