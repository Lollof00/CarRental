package DB;

import java.sql.*;
import java.util.ArrayList;
import java.util.Locale;

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

    public byte[] getPicture()
    {
        byte[] imgbytes = null;
        ArrayList<ArrayList<byte[]>> immagini = new ArrayList<>();
        try {
            result = connect.getConnection().prepareStatement("SELECT * from public.macchine");
            ResultSet resultSet = result.executeQuery();
            ResultSetMetaData rsmd = resultSet.getMetaData();

            int numCols= rsmd.getColumnCount();
            while(resultSet.next()){
                ArrayList<byte[]> riga = new ArrayList<>();
                for (int i=1;i<=numCols;i++) {
                    if (i == numCols)
                    {
                        imgbytes = resultSet.getBytes(resultSet.getString(i));
                        riga.add(imgbytes);
                    }
                }
                immagini.add(riga);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return imgbytes;
    }

    public boolean UpdateVeicoli(String[] veicoli){
        boolean error=false;
        try {
            result = connect.getConnection().prepareStatement("SELECT * from public.macchine where id=?");
            result.setInt(1, Integer.parseInt(veicoli[0]));
            ResultSet resultSet = result.executeQuery();
            if (resultSet.next()){
            result = connect.getConnection().prepareStatement("UPDATE public.macchine SET modello=?,produttore=?,targa=?,giornaliero=?,passeggeri=?,porte=?,bagagli=? where id=?");
            result.setInt(8, Integer.parseInt(veicoli[0]));

            result.setString(1,veicoli[1]);
            result.setInt(2, Integer.parseInt(veicoli[2]));
            result.setString(3, veicoli[3].toUpperCase());
            result.setDouble(4, Double.parseDouble(veicoli[4]));
            result.setInt(5, Integer.parseInt(veicoli[5]));
            result.setInt(6, Integer.parseInt(veicoli[6]));
            result.setInt(7, Integer.parseInt(veicoli[7]));
            result.executeUpdate();
            }else {
                result = connect.getConnection().prepareStatement("INSERT into public.macchine(id,modello,produttore,targa,giornaliero,passeggeri,porte,bagagli) values (?,?,?,?,?,?,?,?)");
                result.setInt(1, Integer.parseInt(veicoli[0]));
                result.setString(2,veicoli[1]);
                result.setInt(3, Integer.parseInt(veicoli[2]));
                result.setString(4, veicoli[3]);
                result.setDouble(5, Double.parseDouble(veicoli[4]));
                result.setInt(6, Integer.parseInt(veicoli[5]));
                result.setInt(7, Integer.parseInt(veicoli[6]));
                result.setInt(8, Integer.parseInt(veicoli[7]));
                result.executeUpdate();
            }

        } catch (Exception e){
            e.printStackTrace();
            error = true;
        }
        return error;
    }

    public boolean DeleteVeicoli(Integer id){
        boolean error = false;
        try{
            result = connect.getConnection().prepareStatement("DELETE FROM public.macchine  where id=?");
            result.setInt(1, id);
            result.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            error = true;
        }
        return error;
    }
}
