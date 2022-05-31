package DB;

import java.sql.*;
import java.util.ArrayList;

public class DbOperations {
    private PreparedStatement result;
    private DbConnect connect= new DbConnect();

    public DbOperations(){
        connect.Connect();
    }

    public String Autenticazione(String username, String password) throws SQLException {
        String ruolo="";
        try {
            result = connect.getConnection().prepareStatement("SELECT * from public.utenti where username=? and password=?");
            result.setString(1,username);
            result.setString(2,password);
            ResultSet resultSet = result.executeQuery();


            if (resultSet.next()){
                //TEST
                ruolo = resultSet.getString("ruolo");
                System.out.println("esiste");
            }else{
                //TEST
                System.out.println("non esiste");
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return ruolo;
    }

    public boolean Registrazione(String nome, String cognome, String cf, String nascita, String email, String username, String password) throws SQLException {
        boolean exist = false;
        if(Autenticazione(username,password).equals("")){
            exist = true;
        }else{
            try{

                Long datetime = System.currentTimeMillis();
                Timestamp timestamp = new Timestamp(datetime);
                result = connect.getConnection().prepareStatement("INSERT into public.utenti(id,nome,cognome,nascita,registrazione,password,username,email,cf,ruolo) values (DEFAULT,?,?,?,?,?,?,?,?,?)");
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

    public ArrayList<ArrayList<String>> GetVeicoli(){
        ArrayList<ArrayList<String>> veicoli = new ArrayList<>();
        try {
            result = connect.getConnection().prepareStatement("SELECT * from public.macchine");
            ResultSet resultSet = result.executeQuery();
            ResultSetMetaData rsmd = resultSet.getMetaData();

            int numCols= rsmd.getColumnCount();
            while(resultSet.next()){
                ArrayList<String> riga = new ArrayList<>();
                for (int i=1;i<=numCols;i++) {
                    riga.add(resultSet.getString(i));
                }
                veicoli.add(riga);
        }
    } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return veicoli;
    }
}
