package DB;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Timestamp;

public class DbConnect {

    private String a ="";

    public static void main(String[] args) throws SQLException {

        Connection connection = null;

        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CarRental?user=lollo&password=lorenzo00");

            if(connection!=null){
                System.out.println("Si");
            }else {
                System.out.println("No");
            }

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        System.out.println(timestamp);
    }
}
