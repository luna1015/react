const express = require('express');
const mysql = require('mysql2/promise');

const app = express();
const PORT = 5000;

// Configura la conexión a la base de datos MySQL
const pool = mysql.createPool({
  host: 'localhost',
  user: 'tu_usuario',
  password: 'tu_contraseña',
  database: 'citas', // Nombre de la base de datos que has utilizado en el archivo SQL
});

app.use(express.json());

// Ruta para manejar las solicitudes de ingreso de usuario
app.post('/api/ingreso-usuario', async (req, res) => {
  try {
    const { usuario, contrasena } = req.body;

    // Realiza la consulta a la base de datos para verificar las credenciales
    const [rows] = await pool.query(
      'SELECT token FROM usuario_sistema WHERE user_usuario = ? AND password_usuario = ?',
      [usuario, contrasena]
    );

    if (rows.length > 0) {
      const token = rows[0].token;
      res.json({ token }); // Devuelve el token en la respuesta
    } else {
      res.status(401).json({ error: 'Credenciales inválidas' });
    }
  } catch (error) {
    console.error('Error al realizar la consulta:', error);
    res.status(500).json({ error: 'Error al procesar la solicitud' });
  }
});

// Inicia el servidor
app.listen(PORT, () => {
  console.log(`Servidor escuchando en http://localhost:${PORT}`);
});
