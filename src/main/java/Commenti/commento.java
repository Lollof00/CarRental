package Commenti;

import DB.DbOperations;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "commento", value = "/commento")
public class commento extends HttpServlet {

    private DbOperations dbOperations;


    public void init() throws ServletException {
        dbOperations = new DbOperations();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String com = req.getParameter("commento");
        String ida = req.getParameter("ida");


        if (!dbOperations.aggiungiCommento(com, Integer.parseInt(ida)))
        {
            System.out.println("Commento inviato con successo");
            resp.sendRedirect("miei-ordini.jsp");
        }


    }
}
