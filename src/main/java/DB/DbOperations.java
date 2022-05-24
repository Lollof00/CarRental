package DB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbOperations {
    private PreparedStatement result;
    private DbConnect connect= new DbConnect();

    public DbOperations(){
        connect.Connect();
    }

    public boolean Autenticazione(String username, String password) throws SQLException {
        boolean exist=false;
        try {
            result = connect.getConnection().prepareStatement("SELECT * from public.utenti where username=? and password=?");
            result.setString(1,username);
            result.setString(2,password);
            ResultSet resultSet = result.executeQuery();

            for(int i=0; i<resultSet.getRow();i++){
                System.out.println(resultSet.getObject(i));
            }
            if (resultSet.next()){
                System.out.println("esiste");
            }else{
                System.out.println("non esiste");
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return exist;
    }
}
