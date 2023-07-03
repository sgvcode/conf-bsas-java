package dev.sgvero.confbsas.sgv;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OradorDAO {

    private final String url = "jdbc:mysql://localhost:3306/confbsas";
    private final String username = "root";
    private final String password = "root";

    public List<Orador> getOradores() {
        List<Orador> oradores = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(url, username, password);
                    PreparedStatement statement = connection.prepareStatement("SELECT * FROM oradores");
                    ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    String nombre = resultSet.getString("nombre");
                    String apellido = resultSet.getString("apellido");
                    String temario = resultSet.getString("temario");

                    Orador orador = new Orador(nombre, apellido, temario);
                    oradores.add(orador);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return oradores;
    }

    public void guardarOrador(String nombre, String apellido, String temario) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(url, username, password);
                    PreparedStatement statement = connection
                            .prepareStatement("INSERT INTO oradores (nombre, apellido, temario) VALUES (?, ?, ?)")) {

                statement.setString(1, nombre);
                statement.setString(2, apellido);
                statement.setString(3, temario);

                int filasAfectadas = statement.executeUpdate();
                if (filasAfectadas > 0) {
                    System.out.println("Orador guardado en la base de datos");
                } else {
                    System.out.println("Error al guardar el orador en la base de datos");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}