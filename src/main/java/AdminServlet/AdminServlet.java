package AdminServlet;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;

import DB.DbOperations;
import org.json.*;

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HttpServlet {
    private DbOperations dbOperations;

    @Override
    public void init() throws ServletException {
        dbOperations = new DbOperations();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        System.out.println(id);
        if(!dbOperations.DeleteVeicoli(Integer.valueOf(id))){
            System.out.println("eliminazione effettuata");
        }else {
            System.out.println("eliminazione non riuscita");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] data = req.getParameterValues("d[]");

        if(!dbOperations.UpdateVeicoli(data)){
            System.out.println("modifica effettuata");
        }else{
            System.out.println("errore nella modifica");
        }

    }

}
