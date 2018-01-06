require 'socket' #Importa módulo socket

# Inicia servidor TCP na porta 2345
server = TCPServer.new('localhost', 2345)

# Inicia loop infinito
loop do

# Aguarda que um cliente se conecte e em seguida retorna um socket TCP
  socket  = server.accept

# Lê a primeira linha da request
  request = socket.gets

# Imprime a request no terminal
  STDERR.puts request

  response = 'Hello World for my webserver'

 # Imprime cabeçalhos HTTP e calcula tamanho da resposta na linha 23
 # com response.bytesize
  socket.print 'HTTP/1.1 200ok\r\n'+
               'Content-Type: text/plain\r\n' +
               'Content-Length: #{response.bytesize}\r\n' +
               'Connection: close\r\n'

# Imprime uma linha em branco para separar os cabeçalhos do conteúdo da resposta
# assim como é exigido no protocolo HTTP
  socket.print '\r\n'

# Imprime a resposta atual um Hello World for my webserver
  socket.print response

# Feche o soquete, terminando a conexão
  socket.close
