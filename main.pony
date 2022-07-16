use "net"

actor Main
  new create(env: Env) =>
    var gopherd: GopherServer = GopherServer(70, TCPListenAuth(env.root), env.out)


