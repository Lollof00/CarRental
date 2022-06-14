package AdminServlet;



import javax.servlet.RequestDispatcher;
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
import Utility.ServletUtility;
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
            ServletUtility.setSuccessMessage("Eliminazione effettuata",req);
            req.getRequestDispatcher("admin/admin-page.jsp").forward(req,resp);
        }else {
            ServletUtility.setErrorMessage("L'eliminazione non è andata a buon fine",req);
            req.getRequestDispatcher("admin/admin-page.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] data = req.getParameterValues("d[]");
        if(!dbOperations.UpdateVeicoli(data)){
            ServletUtility.setSuccessMessage("Inserimento o modifica effettuata",req);
            req.getRequestDispatcher("admin/admin-page.jsp").forward(req,resp);
        }else{
            ServletUtility.setErrorMessage("L'inserimento o la modifica non è andata a buon fine",req);
            req.getRequestDispatcher("admin/admin-page.jsp").forward(req,resp);
        }

    }

}
