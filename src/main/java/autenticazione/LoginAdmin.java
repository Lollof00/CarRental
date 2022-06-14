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

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login-admin.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        try {
            if(dbOperations.Autenticazione(username,password).equals("admin")){
                HttpSession session = req.getSession(true);
                session.setAttribute("username",username);
                session.setAttribute("ruolo","admin");
                resp.sendRedirect("admin/admin-page.jsp");
            }else{
                ServletUtility.setErrorMessage("Nome utente o password errati",req);
                req.getRequestDispatcher("admin/login-admin.jsp").forward(req,resp);
            };
        } catch (SQLException e) {
            ServletUtility.setErrorMessage("Qualcosa è andato storto",req);
            req.getRequestDispatcher("admin/login-admin.jsp").forward(req,resp);
        }

    }
}
