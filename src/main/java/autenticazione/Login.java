package autenticazione;

import DB.DbConnect;
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

@WebServlet(name = "login", value = "/login")
public class Login extends HttpServlet {

    private DbOperations dbOperations;

    @Override
    public void init() throws ServletException {
       dbOperations = new DbOperations();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.getRequestDispatcher("login-user.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        try {
            if(dbOperations.Autenticazione(username,password).equals("user")){
                HttpSession session = req.getSession(true);
                session.setAttribute("username",username);
                resp.sendRedirect("home/index.jsp");
            }else{
                ServletUtility.setErrorMessage("Nome utente o password errati",req);
                req.getRequestDispatcher("login-user.jsp").forward(req,resp);
            }
        } catch (SQLException e) {
            ServletUtility.setErrorMessage("Qualcosa è andato storto",req);
            req.getRequestDispatcher("login-user.jsp").forward(req,resp);
        }
    }

}
