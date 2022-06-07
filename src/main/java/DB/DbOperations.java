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
        System.out.println(ruolo);
        return ruolo;
    }

    public boolean Registrazione(String nome, String cognome, String cf, String nascita, String email, String username, String password,Enum ruolo ) throws SQLException {
        boolean error = false;
        if(Autenticazione(username,password).equals("")){
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
                result.setObject(9,ruolo,Types.OTHER);
                result.executeUpdate();
            } catch (Exception e){
                e.printStackTrace();
            }
        }else {
            error=true;
        }
        return error;
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

    public boolean UpdateVeicoli(String[] veicoli){
        boolean error=false;
        try {
            result = connect.getConnection().prepareStatement("SELECT * from public.macchine where id=?");
            result.setInt(1, Integer.parseInt(veicoli[0]));
            ResultSet resultSet = result.executeQuery();
            if (resultSet.next()){
            result = connect.getConnection().prepareStatement("UPDATE public.macchine SET modello=?,produttore=?,targa=?,giornaliero=?,passeggeri=?,porte=?,bagagli=?,image=? where id=?");
            result.setInt(9, Integer.parseInt(veicoli[0]));

            result.setString(1,veicoli[1]);
            result.setInt(2, Integer.parseInt(veicoli[2]));
            result.setString(3, veicoli[3].toUpperCase());
            result.setDouble(4, Double.parseDouble(veicoli[4]));
            result.setInt(5, Integer.parseInt(veicoli[5]));
            result.setInt(6, Integer.parseInt(veicoli[6]));
            result.setInt(7, Integer.parseInt(veicoli[7]));
            result.setString(8,veicoli[8]);
            result.executeUpdate();
            }else {
                result = connect.getConnection().prepareStatement("INSERT into public.macchine(id,modello,produttore,targa,giornaliero,passeggeri,porte,bagagli,image) values (?,?,?,?,?,?,?,?,?)");
                result.setInt(1, Integer.parseInt(veicoli[0]));
                result.setString(2,veicoli[1]);
                result.setInt(3, Integer.parseInt(veicoli[2]));
                result.setString(4, veicoli[3]);
                result.setDouble(5, Double.parseDouble(veicoli[4]));
                result.setInt(6, Integer.parseInt(veicoli[5]));
                result.setInt(7, Integer.parseInt(veicoli[6]));
                result.setInt(8, Integer.parseInt(veicoli[7]));
                result.setString(9, veicoli[8]);
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


    public Boolean aggiungiOrdine(String inizio, String utente, String fine, String id_macchina, String ret_location, String full_name, String email, String phone, String pick_up_location) throws SQLException
    {
        boolean error = false;
            try{

                Timestamp start = Timestamp.valueOf(inizio);
                Timestamp end = Timestamp.valueOf(fine);
                result = connect.getConnection().prepareStatement("INSERT into public.ordini(id,inizio,utente,fine,id_macchina) values (DEFAULT,?,?,?,?,?,?,?,?,?)");
                result.setTimestamp(1, start);
                result.setString(2,utente);
                result.setTimestamp(3, end);
                result.setInt(4, Integer.parseInt(id_macchina));
                result.setString(5, ret_location);
                result.setString(6, full_name);
                result.setString(7, email);
                result.setString(8, phone);
                result.setString(9, pick_up_location);
                result.executeUpdate();
            } catch (Exception e){
                e.printStackTrace();
            }
        return error;
    }





}


