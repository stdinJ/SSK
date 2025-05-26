package app;

import controller.CriancaController;
import controller.ResponsavelController;
import controller.RotinaController;
import controller.UserController;
import dao.UserDAO;
import static spark.Spark.get;
import static spark.Spark.port;
import static spark.Spark.staticFiles;

public class App {
    public static void main(String[] args) {
        // Define a porta do servidor
        port(8081);

        staticFiles.location("/public");


        get("/", (req, res) -> "Servidor rodando!");
        // Cria a tabela User, se necessário
        UserDAO userDAO = new UserDAO();
        userDAO.createTable();

        // Instancia os controllers que configuram as rotas
        new ResponsavelController();
        new CriancaController();
        RotinaController.configurarRotas();
        UserController.configurarRotas();
        System.out.println("Servidor rodando em http://localhost:8081/");
    }
}
