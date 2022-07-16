use "net"

class GopherSession is TCPConnectionNotify
  let out: OutStream
  var request: Array[U8] iso = recover iso Array[U8](64) end

  new iso create(out': OutStream) =>
    out = out'

  fun connect_failed(conn: TCPConnection ref) =>
    out.print("connect_failed called")

  fun accepted(conn: TCPConnection ref) =>
    out.print("TCP Connection Established")

  fun closed(conn: TCPConnection ref) =>
    out.print("TCP Connection Closed")

  fun ref received(conn: TCPConnection ref, data: Array[U8] iso, times: USize): Bool =>
    let ro: Array[U8] val = consume data
    try
      let s: USize = ro.rfind('\r')?
      request.append(ro.trim(0, s))
      let requestro: Array[U8] val = request = recover iso Array[U8](64) end
      out.print("Full Request: '" + String.from_array(requestro) + "'")

      conn.write(
        """
        1Test String	/	gopher.floodgap.com	70
        """)
      conn.dispose()
    else
      request.append(ro)
    end

    request.append(ro)
    true
