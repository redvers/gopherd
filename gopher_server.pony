use "net"

class GopherServer
  var port: USize = 0
  let auth: TCPListenAuth
  let out: OutStream
  new create(port': USize, auth': TCPListenAuth, out': OutStream) =>
    port = port'
    auth = auth'
    out = out'
    TCPListener(auth, recover iso GopherListener(out) end, "", port.string())



