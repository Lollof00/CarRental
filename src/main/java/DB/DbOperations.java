package DB;

import java.sql.*;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


public class DbOperations {
    private PreparedStatement result;
    private PreparedStatement result2;
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
        System.out.println(Arrays.toString(Arrays.stream(veicoli).toArray()));
        boolean error=false;
        try {
            result = connect.getConnection().prepareStatement("SELECT * from public.macchine where id=?");
            result.setInt(1, Integer.parseInt(veicoli[0]));
            ResultSet resultSet = result.executeQuery();
            if (resultSet.next()){
            result = connect.getConnection().prepareStatement("UPDATE public.macchine SET modello=?,targa=?,giornaliero=?,passeggeri=?,porte=?,bagagli=?,image=?,produttore=? where id=?");
            result.setInt(9, Integer.parseInt(veicoli[0]));
            result.setString(1,veicoli[1]);
            result.setString(2, veicoli[3].toUpperCase());
            result.setDouble(3, Double.parseDouble(veicoli[4]));
            result.setInt(4, Integer.parseInt(veicoli[5]));
            result.setInt(5, Integer.parseInt(veicoli[6]));
            result.setInt(6, Integer.parseInt(veicoli[7]));
            result.setString(7,veicoli[8]);
            result.setString(8,veicoli[2]);
            result.executeUpdate();
            }else {
                result = connect.getConnection().prepareStatement("INSERT into public.macchine(id,modello,targa,giornaliero,passeggeri,porte,bagagli,image,produttore) values (?,?,?,?,?,?,?,?,?)");
                result.setInt(1, Integer.parseInt(veicoli[0]));
                result.setString(2,veicoli[1]);
                result.setString(3, veicoli[3].toUpperCase());
                result.setDouble(4, Double.parseDouble(veicoli[4]));
                result.setInt(5, Integer.parseInt(veicoli[5]));
                result.setInt(6, Integer.parseInt(veicoli[6]));
                result.setInt(7, Integer.parseInt(veicoli[7]));
                result.setString(8, veicoli[8]);
                result.setString(9, veicoli[2]);
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


    public Boolean aggiungiOrdine(Date inizio, String utente, Date fine, String id_macchina, String ret_location, String full_name, String email, String phone, String pick_up_location, String commento, String flag) throws SQLException
    {
        boolean error = false;
            try{

                result = connect.getConnection().prepareStatement("INSERT into public.ordini(id,id_macchina,return_location,full_name,email,phone,pick_up_location,inizio,fine,utente,commento,is_commentato) values (DEFAULT,?,?,?,?,?,?,?,?,?,?,?)");
                result.setInt(1, Integer.parseInt(id_macchina));
                result.setString(2,ret_location);
                result.setString(3, full_name);
                result.setString(4, email);
                result.setString(5, phone);
                result.setString(6, pick_up_location);
                result.setDate(7, inizio);
                result.setDate(8, fine);
                result.setString(9, utente);
                result.setString(10, "");
                result.setString(11, "0");
                result.executeUpdate();
            } catch (Exception e){
                e.printStackTrace();
            }
        return error;
    }

    public ArrayList<ArrayList<String>> getOrdiniUtente(String utente)
    {
        ArrayList<ArrayList<String>> finishArray = new ArrayList<>();
        try{
            result = connect.getConnection().prepareStatement("SELECT id_macchina,utente from public.ordini");
            ResultSet resultSet = result.executeQuery();


            ArrayList<Integer> idOrdinati = new ArrayList<>();
            while (resultSet.next()) {
                String utenteConferma = resultSet.getString("utente");
                if (utenteConferma.equals(utente))
                {
                    int id = resultSet.getInt("id_macchina");
                    idOrdinati.add(id);
                }
            }


            result = connect.getConnection().prepareStatement("SELECT * from public.macchine, public.ordini " +
                                                                 "WHERE macchine.id = ordini.id_macchina");
            ResultSet resultSet2 = result.executeQuery();
            ResultSetMetaData rsmd2 = resultSet2.getMetaData();


            int numColTot = rsmd2.getColumnCount();
            while (resultSet2.next())
            {
                ArrayList<String> riga = new ArrayList<>();
                for (int i = 1; i <= numColTot; i++)
                {
                    riga.add(resultSet2.getString(i));
                }
                finishArray.add(riga);
            }

        }catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        System.out.println(finishArray);
        return finishArray;
    }

    public ArrayList<ArrayList<String>> getAvailableVeicoli(java.util.Date pickUp, java.util.Date dropOff){
        ArrayList<ArrayList<String>> veicoliDisponibili = new ArrayList<>();
        try {
            result = connect.getConnection().prepareStatement("SELECT inizio,fine,id_macchina from public.ordini");
            ResultSet resultSet = result.executeQuery();
            ResultSetMetaData rsmd = resultSet.getMetaData();


            Set<Integer> idCartoNotInclude = new HashSet<>();
            if (resultSet.next()) {
                while (resultSet.next()) {
                    String inzio = resultSet.getString("inizio");
                    String fine = resultSet.getString("fine");
                    if (((pickUp.after(new SimpleDateFormat("yyyy-MM-dd").parse(inzio)) || pickUp.equals(new SimpleDateFormat("yyyy-MM-dd").parse(inzio))) && (dropOff.before(new SimpleDateFormat("yyyy-MM-dd").parse(fine)) || dropOff.equals(new SimpleDateFormat("yyyy-MM-dd").parse(fine)))) || ((pickUp.before(new SimpleDateFormat("yyyy-MM-dd").parse(inzio)) || pickUp.equals(new SimpleDateFormat("yyyy-MM-dd").parse(inzio))) && dropOff.before(new SimpleDateFormat("yyyy-MM-dd").parse(fine)))) {
                        idCartoNotInclude.add(resultSet.getInt("id_macchina"));
                    }
                }
            }

            result = connect.getConnection().prepareStatement("SELECT * from public.macchine");
            ResultSet resultSet2 = result.executeQuery();
            ResultSetMetaData rsmd2 = resultSet2.getMetaData();

            int numCols= rsmd2.getColumnCount();
            while(resultSet2.next()){
                ArrayList<String> riga = new ArrayList<>();
                if(!idCartoNotInclude.contains(resultSet2.getInt("id"))) {
                    for (int i = 1; i <= numCols; i++) {
                        riga.add(resultSet2.getString(i));
                    }
                    veicoliDisponibili.add(riga);
                }
            }

        } catch (SQLException | ParseException e) {
            throw new RuntimeException(e);
        }

        return veicoliDisponibili;
    }


    public String getUserEmail(String email){
        String password ="";
        try {
            result = connect.getConnection().prepareStatement("SELECT email,password from public.utenti where email=?");
            result.setString(1,email);
            ResultSet resultSet = result.executeQuery();


            if (resultSet.next()){
                //TEST
                password = resultSet.getString("password");
                System.out.println("esiste");
            }else{
                //TEST
                System.out.println("non esiste");
            }

        } catch (Exception e){
            e.printStackTrace();
        }

        return password;
    }

    public Boolean aggiungiCommento(String commento, int id)
    {
        System.out.println(id + " " + commento);
        boolean error = false;
        try {
            result = connect.getConnection().prepareStatement("SELECT * from public.ordini");
            ResultSet resultSet = result.executeQuery();
            ResultSetMetaData rsmd = resultSet.getMetaData();
            while (resultSet.next())
            {
                if(resultSet.getInt(1) == id)
                {
                    result = connect.getConnection().prepareStatement("UPDATE public.ordini SET id=?, id_macchina=?, return_location=?, full_name=?, email=?, phone=?, pick_up_location=?, inizio=?, fine=?, utente=?, commento=?, is_commentato=? where id=?");
                    result.setInt(1, id);
                    result.setInt(2, resultSet.getInt(2));
                    result.setString(3, resultSet.getString(3));
                    result.setString(4, resultSet.getString(4));
                    result.setString(5, resultSet.getString(5));
                    result.setString(6, resultSet.getString(6));
                    result.setString(7, resultSet.getString(7));
                    result.setDate(8, Date.valueOf(resultSet.getString(8)));
                    result.setDate(9, Date.valueOf(resultSet.getString(9)));
                    result.setString(10, resultSet.getString(10));
                    result.setString(11, commento);
                    result.setString(12, "1");
                    result.setInt(13, id);
                    result.executeUpdate();
                }
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return error;
    }

    // le query del conteggio potevano essere fatte anche con SELECT COUNT(*)

    public int conteggioMacchine()
    {
        int numeroMacchine = 0;
        try {
            result = connect.getConnection().prepareStatement("SELECT * from public.macchine");
            ResultSet resultSet = result.executeQuery();
            while (resultSet.next())
            {
                numeroMacchine++;
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return numeroMacchine;
    }

    public int conteggioOrdini()
    {
        int numeroOrdini = 0;
        try {
            result = connect.getConnection().prepareStatement("SELECT * from public.ordini");
            ResultSet resultSet = result.executeQuery();
            while (resultSet.next())
            {
                numeroOrdini++;
            }

        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return numeroOrdini;
    }

    public int conteggioCommenti()
    {
        int numeroCommenti = 0;
        try {
            result = connect.getConnection().prepareStatement("SELECT * from public.ordini " +
                    "WHERE ordini.is_commentato = '1'");
            ResultSet resultSet = result.executeQuery();
            while (resultSet.next())
            {
                numeroCommenti++;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return numeroCommenti;
    }

    public int conteggioUtenti()
    {
        int numeroUtenti = 0;
        try {
            result = connect.getConnection().prepareStatement("SELECT * from public.utenti " +
                    "WHERE utenti.ruolo = 'user'");
            ResultSet resultSet = result.executeQuery();
            while (resultSet.next())
            {
                numeroUtenti++;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return numeroUtenti;
    }

    public ArrayList<ArrayList<String>> getCommentiUtenti()
    {
        ArrayList<ArrayList<String>> commenti = new ArrayList<>();
        try{
            result = connect.getConnection().prepareStatement("SELECT utente, commento FROM public.ordini WHERE ordini.is_commentato = '1'");
            ResultSet resultSet = result.executeQuery();
            while (resultSet.next())
            {
                ArrayList<String> riga = new ArrayList<>();
                riga.add(resultSet.getString("utente"));
                riga.add(resultSet.getString("commento"));
                commenti.add(riga);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return commenti;
    }

    public ArrayList<ArrayList<String>> getAllOrdini()
    {
        ArrayList<ArrayList<String>> AllOrdini = new ArrayList<>();
        try{
            result = connect.getConnection().prepareStatement("SELECT * from public.ordini");
            ResultSet resultSet = result.executeQuery();
            ResultSetMetaData rsmd = resultSet.getMetaData();


            int numColTot = rsmd.getColumnCount();
            while (resultSet.next())
            {
                ArrayList<String> riga = new ArrayList<>();
                for (int i = 1; i <= numColTot; i++)
                {
                    riga.add(resultSet.getString(i));
                }
                AllOrdini.add(riga);
            }

        }catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        System.out.println(AllOrdini);
        return AllOrdini;
    }

    public ArrayList<ArrayList<String>> getAeroporti()
    {
        ArrayList<ArrayList<String>> aereoporti = new ArrayList<>();
        try{
            result = connect.getConnection().prepareStatement("SELECT * from public.aereoporti");
            ResultSet resultSet = result.executeQuery();
            ResultSetMetaData rsmd = resultSet.getMetaData();


            int numColTot = rsmd.getColumnCount();
            while (resultSet.next())
            {
                ArrayList<String> riga = new ArrayList<>();
                for (int i = 1; i <= numColTot; i++)
                {
                    riga.add(resultSet.getString(i));
                }
                aereoporti.add(riga);
            }

        }catch (SQLException e)
        {
            throw new RuntimeException(e);
        }

        return aereoporti;
    }


}


