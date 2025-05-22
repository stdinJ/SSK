package app;

import static spark.Spark.get;
import static spark.Spark.port;

public class App {
    public static void main(String[] args) {
        port(8080);  // Define a porta 8080 para o servidor Spark
        get("/", (req, res) -> "Hello World!");
    }
}
