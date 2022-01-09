import javax.net.ssl.SSLServerSocket;
import javax.net.ssl.SSLServerSocketFactory;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.nio.charset.StandardCharsets;

public class Server {
    public static void main(String[] args) throws IOException {
        int port = 5000;
        InetAddress localhost = InetAddress.getByName("localhost");
        try (SSLServerSocket serverSocket = (SSLServerSocket) SSLServerSocketFactory.getDefault().createServerSocket(port, 0, localhost)) {
            serverSocket.setNeedClientAuth(true);
            System.out.printf("Listening on %s%n", serverSocket);
            while (true) {
                try (var socket = serverSocket.accept()) {
                    var in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                    String line;
                    while ((line = in.readLine()) != null) {
                        System.out.println(line);
                        if (line.isEmpty()) {
                            break;
                        }
                    }

                    var response = """
                            HTTP/1.1 200 OK
                            Content-Type: text/html
                            
                            <h1>Hello, World!</h1>
                            """;
                    socket.getOutputStream().write(response.getBytes(StandardCharsets.UTF_8));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
