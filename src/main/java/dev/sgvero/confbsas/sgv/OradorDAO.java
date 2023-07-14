package dev.sgvero.confbsas.sgv;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OradorDAO {
    private static final String INSERT_QUERY = "INSERT INTO oradores (nombre, apellido, temario, foto) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ALL_QUERY = "SELECT id, nombre, apellido, temario, foto FROM oradores";
    private static final String SELECT_BY_ID_QUERY = "SELECT id, nombre, apellido, temario, foto FROM oradores WHERE id = ?";
    private static final String UPDATE_QUERY = "UPDATE oradores SET nombre = ?, apellido = ?, temario = ?, foto = ? WHERE id = ?";
    private static final String DELETE_QUERY = "DELETE FROM oradores WHERE id = ?";

    public void guardarOrador(String nombre, String apellido, String temario, String foto) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_QUERY)) {
            statement.setString(1, nombre);
            statement.setString(2, apellido);
            statement.setString(3, temario);
            statement.setString(4, foto);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Orador> getOradores() {
        List<Orador> oradores = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_QUERY);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");
                String temario = resultSet.getString("temario");
                String foto = resultSet.getString("foto");
                Orador orador = new Orador(id, nombre, apellido, temario, foto);
                oradores.add(orador);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return oradores;
    }

    public Orador getOradorById(int id) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_BY_ID_QUERY)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String nombre = resultSet.getString("nombre");
                    String apellido = resultSet.getString("apellido");
                    String temario = resultSet.getString("temario");
                    String foto = resultSet.getString("foto");
                    return new Orador(id, nombre, apellido, temario, foto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void editarOrador(int id, String nombre, String apellido, String temario, String foto) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_QUERY)) {
            statement.setString(1, nombre);
            statement.setString(2, apellido);
            statement.setString(3, temario);
            statement.setString(4, foto);
            statement.setInt(5, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void borrarOrador(int id) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_QUERY)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
