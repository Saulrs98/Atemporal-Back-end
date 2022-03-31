const express = require('express')
const morgan = require('morgan')
const cors = require('cors')

const { initRoutes } = require('./routes')

// Constants
const PORT = 4000

const app = express()

// Middlewares
app.use(cors()) // Una configuracion de seguridad entre headers
app.use(express.json()) // Parsea lo que llega al servidor en formato json
app.use(morgan('dev')) // Muestra en consola la url, tiempo y status solicitado

// undefined

initRoutes(app)

module.exports = {
  PORT,
  app
}
