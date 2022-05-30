package autenticazione;

import DB.DbOperations;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;

@WebServlet(name = "registrazione", value = "/registrazione")
public class Registrazione extends HttpServlet {
    private DbOperations dbOperations;

    @Override
    public void init() throws ServletException {
        dbOperations = new DbOperations();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nome = req.getParameter("nome");
        String cognome = req.getParameter("cognome");
        String cf = req.getParameter("cf");
        String nascita = req.getParameter("nascita");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        String path = req.getParameter("Path");
        System.out.println(req.getParameter("Path"));

        try {
            dbOperations.Registrazione(nome,cognome,cf,nascita,email,username,password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
