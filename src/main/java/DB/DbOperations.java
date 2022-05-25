package DB;

import java.sql.*;

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
                exist = true;
            }else{
                System.out.println("non esiste");
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return exist;
    }

    public boolean Registrazione(String nome, String cognome, String cf, String nascita, String email, String username, String password) throws SQLException {
        boolean exist = false;
        if(Autenticazione(username,password)){
            exist = true;
        }else{
            try{

                Long datetime = System.currentTimeMillis();
                Timestamp timestamp = new Timestamp(datetime);
                result = connect.getConnection().prepareStatement("INSERT into public.utenti(id,nome,cognome,nascita,registrazione,password,username,email,cf) values (DEFAULT,?,?,?,?,?,?,?,?)");
                result.setString(1,nome);
                result.setString(2,cognome);
                result.setDate(3, Date.valueOf(nascita));
                result.setTimestamp(4,timestamp);
                result.setString(5,password);
                result.setString(6,username);
                result.setString(7,email);
                result.setString(8,cf);
                result.executeUpdate();
            } catch (Exception e){
                e.printStackTrace();
            }
        }
        return exist;
    }
}
