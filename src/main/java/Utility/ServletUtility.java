package Utility;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ServletUtility {
    static String Error ="Invalid data";
    static String SuccessMessage = "Done";

    public  static void forward(String page, HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException{
        RequestDispatcher rd = request.getRequestDispatcher(page);
        System.out.println(page);
        rd.forward(request,response);
    }

    public void handleException(Exception e, HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        request.setAttribute("exception",e);
        ServletUtility.forward("Error Message",request,response);
        e.printStackTrace();
    }

    public static String getErrorMessage(String property, HttpServletRequest request){
        String val = (String) request.getAttribute(property);
        if(val==null){
            return "";
        }else {
            return val;
        }
    }

    public static String getMessage(String property, HttpServletRequest request) {
        String val = (String) request.getAttribute(property);
        if (val == null) {
            return "";
        } else {
            return val;
        }
    }

    public static void setErrorMessage(String msg, HttpServletRequest request){
        request.setAttribute(Error,msg);
    }

    public static String getErrorMessage(HttpServletRequest request) {
        String val = (String) request.getAttribute(Error);
        if (val == null) {
            return "";
        } else {
            return val;
        }
    }

    public static void setSuccessMessage(String msg, HttpServletRequest request) {
        request.setAttribute(SuccessMessage, msg);
    }
    public static String getSuccessMessage(HttpServletRequest request) {
        String val = (String) request.getAttribute(SuccessMessage);
        if (val == null) {
            return "";
        } else {
            return val;
        }
    }
}
