// IngresoUsuario.js

import React from "react";
import "./style.css"; // Importa tu archivo CSS aquí
import axios from 'axios';

class IngresoUsuario extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      usuario: "",
      contrasena: "",
      errorMessage: "" // Agrega el estado para el mensaje de error
    };
  }

  handleInputChange = event => {
    const { name, value } = event.target;
    this.setState({ [name]: value, errorMessage: "" });
  };

  handleSubmit = async (event) => {
    event.preventDefault();
  
    const { usuario, contrasena } = this.state;
    console.log('Datos enviados al servidor:', { user_usuario: usuario, password_usuario: contrasena });
  
    try {
      const response = await axios.post('http://localhost:5000/api/ingreso-usuario', {
        user_usuario: usuario,
        password_usuario: contrasena,
      });
  
      console.log('Respuesta del servidor:', response.data);
      if (response?.data?.token?.length > 0) {
        const token = response.data.token;
        // Aquí puedes redirigir al usuario a la página de menú si lo deseas, o realizar otras acciones con el token.
        // Por ejemplo, almacenarlo en el estado global de la aplicación o en el local storage para futuras solicitudes.
        console.log('Token:', token);
        this.setState({ errorMessage: 'Usuario válido.' });
      } else {
        console.log(response.data.token.length);
        // Mostramos un mensaje de error si las credenciales son inválidas
        this.setState({ errorMessage: 'Usuario y/o clave inválida.' });
      }
    } catch (err) {
      console.error('Error al enviar los datos al servidor:', err);
      this.setState({ errorMessage: 'Usuario y/o clave inválida.' });
    }
  };
  

  render() {
    return (
      <div>
        <img src="logoBody.png" className="logoBodyCare" alt="Logo" />
        <div className="rectanguloLogo">&nbsp;</div>
        <label className="tituloGeneral">Ingreso Usuario dd</label>
        <form onSubmit={this.handleSubmit} className="estiloFormulario">
          <fieldset id="estiloFieldset">
            <legend>Datos Acceso</legend>
            <div className="elementoFormulario">
              <label htmlFor="usuario">Usuario:</label>
              <input
                type="text"
                id="usuario"
                name="usuario"
                value={this.state.usuario}
                onChange={this.handleInputChange}
                required
              />
            </div>
            <div className="elementoFormulario">
              <label htmlFor="contrasena">Contraseña:</label>
              <input
                type="password"
                id="contrasena"
                name="contrasena"
                value={this.state.contrasena}
                onChange={this.handleInputChange}
                required
              />
            </div>
            <div className="botonFormulario">
              <input type="submit" value="Aceptar" />
            </div>
            <div className="form-msg" />
          </fieldset>
        </form>
        {/* Mostramos el mensaje de error si existe */}
        {this.state.errorMessage &&
          <div className="form-msg">
            {this.state.errorMessage}
          </div>}
      </div>
    );
  }
}

export default IngresoUsuario;
