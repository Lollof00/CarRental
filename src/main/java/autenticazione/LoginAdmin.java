package autenticazione;

import DB.DbOperations;
import Utility.ServletUtility;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "loginAdmin", value = "/loginAdmin")
public class LoginAdmin extends HttpServlet {
    private DbOperations dbOperations;

    @Override
    public void init() throws ServletException {
        dbOperations = new DbOperations();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        try {
            if(dbOperations.Autenticazione(username,password).equals("admin")){
                HttpSession session = req.getSession(true);
                resp.sendRedirect("admin-page.jsp");
            }else{
                ServletUtility.setErrorMessage("Nome utente o password errati",req);
                req.getRequestDispatcher("login-admin.jsp").forward(req,resp);
            };
        } catch (SQLException e) {
            ServletUtility.setErrorMessage("Qualcosa è andato storto",req);
            req.getRequestDispatcher("login-admin.jsp").forward(req,resp);
        }

    }
}
