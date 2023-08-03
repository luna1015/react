const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql');
const jwt = require('jsonwebtoken'); // Biblioteca para trabajar con tokens JWT

const app = express();
const port = 5000;

app.use(bodyParser.json());
app.use(cors());

const connection = mysql.createConnection({
  host: 'localhost', // Cambia esto por el host de tu servidor MySQL
  user: 'root', // Cambia esto por el nombre de usuario de tu base de datos
  password: '', // Cambia esto por la contraseña de tu base de datos
  database: 'citas', // Cambia esto por el nombre de tu base de datos
});

const secretKey = 'f2bd4633387b9b48c52e1d013d4a83da'; // Cambia esto por tu clave secreta para el token JWT

// Establece la conexión a la base de datos
connection.connect((err) => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err);
  } else {
    console.log('Conexión exitosa a la base de datos.');
  }
});

// Ruta para manejar la solicitud de inicio de sesión desde el front-end
app.post('/api/ingreso-usuario', (req, res) => {
  const { user_usuario, password_usuario } = req.body;

  connection.query(
    'SELECT * FROM usuario_sistema WHERE user_usuario = ? AND password_usuario = ?',
    [user_usuario, password_usuario],
    (error, results) => {
      if (error) {
        console.error('Error al realizar la consulta:', error);
        res.status(500).json({ message: 'Error en el servidor.' });
      } else {
        console.log('Resultados de la consulta:', results); // Agrega este mensaje de registro

        if (results.length > 0) {
          const token = jwt.sign({ user_usuario }, secretKey, { expiresIn: '1h' });
          res.json({ token });
        } else {
          res.status(401).json({ message: 'Usuario y/o clave inválida.' });
        }
      }
    }
  );
});

app.listen(port, () => {
  console.log(`Servidor del back-end está en funcionamiento en el puerto ${port}`);
});
