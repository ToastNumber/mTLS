import javax.net.ssl.SSLServerSocket;
import javax.net.ssl.SSLServerSocketFactory;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.nio.charset.StandardCharsets;

public class Server {
    public static void main(String[] args) throws IOException {
        try (SSLServerSocket serverSocket = (SSLServerSocket) SSLServerSocketFactory.getDefault()
                .createServerSocket(5000, 0, InetAddress.getByName("localhost"))) {
            System.out.println(serverSocket);
            serverSocket.setNeedClientAuth(true);
            while (true) {
                try (var socket = serverSocket.accept()) {
                    System.out.println("Client connected!");
                    var reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));

                    String line;
                    while ((line = reader.readLine()) != null) {
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
                    System.out.println("Writing response ...");
                    socket.getOutputStream().write(response.getBytes(StandardCharsets.UTF_8));
                    socket.getOutputStream().flush();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
