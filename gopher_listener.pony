use "net"

class GopherListener is TCPListenNotify
  let out: OutStream
  new create(out': OutStream) =>
    out = out'

  fun not_listening(listen: TCPListener ref): None =>
    out.print("Unable to bind to port")

  fun connected(listen: TCPListener ref): GopherSession iso^ =>
    GopherSession(out)




