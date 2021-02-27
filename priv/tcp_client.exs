{:ok, sock} = :gen_tcp.connect("localhost", 4040, [:binary], 5000)
:ok = :gen_tcp.send(sock, "Some Data")
:ok = :gen_tcp.close(sock)
