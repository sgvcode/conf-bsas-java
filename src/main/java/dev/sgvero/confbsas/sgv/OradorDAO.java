package dev.sgvero.confbsas.sgv;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OradorDAO {

    private final String url = "jdbc:mysql://localhost:3306/confbsas";
    private final String username = "root";
    private final String password = "root";

    // ...

    public List<Orador> getOradores() {
        List<Orador> oradores = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(url, username, password);
                 PreparedStatement statement = connection.prepareStatement("SELECT * FROM oradores");
                 ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String nombre = resultSet.getString("nombre");
                    String apellido = resultSet.getString("apellido");
                    String temario = resultSet.getString("temario");

                    Orador orador = new Orador(id, nombre, apellido, temario);
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
                 PreparedStatement statement = connection.prepareStatement("INSERT INTO oradores (nombre, apellido, temario) VALUES (?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {

                statement.setString(1, nombre);
                statement.setString(2, apellido);
                statement.setString(3, temario);

                int filasAfectadas = statement.executeUpdate();
                if (filasAfectadas > 0) {
                    System.out.println("Orador guardado en la base de datos");

                    // Obtener el ID generado para el nuevo orador
                    ResultSet generatedKeys = statement.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        int id = generatedKeys.getInt(1);
                        System.out.println("ID del nuevo orador: " + id);
                    }
                } else {
                    System.out.println("Error al guardar el orador en la base de datos");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public Orador getOradorById(int id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(url, username, password);
                 PreparedStatement statement = connection.prepareStatement("SELECT * FROM oradores WHERE id = ?")) {

                statement.setInt(1, id);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        String nombre = resultSet.getString("nombre");
                        String apellido = resultSet.getString("apellido");
                        String temario = resultSet.getString("temario");

                        return new Orador(id, nombre, apellido, temario);
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void editarOrador(int id, String nombre, String apellido, String temario) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(url, username, password);
                 PreparedStatement statement = connection.prepareStatement("UPDATE oradores SET nombre = ?, apellido = ?, temario = ? WHERE id = ?")) {

                statement.setString(1, nombre);
                statement.setString(2, apellido);
                statement.setString(3, temario);
                statement.setInt(4, id);

                int filasAfectadas = statement.executeUpdate();
                if (filasAfectadas > 0) {
                    System.out.println("Orador actualizado en la base de datos");
                } else {
                    System.out.println("Error al actualizar el orador en la base de datos");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void borrarOrador(int id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(url, username, password);
                 PreparedStatement statement = connection.prepareStatement("DELETE FROM oradores WHERE id = ?")) {

                statement.setInt(1, id);

                int filasAfectadas = statement.executeUpdate();
                if (filasAfectadas > 0) {
                    System.out.println("Orador borrado de la base de datos");
                } else {
                    System.out.println("Error al borrar el orador de la base de datos");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    // ...
}

