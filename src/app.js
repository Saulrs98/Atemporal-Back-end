import express from 'express'
import morgan from 'morgan'
import cors from 'cors'

import { initRoutes } from './routes'
// Constantes
const PORT = 4000

const app = express()
app.disable('etag')

// Middlewares
app.use(cors()) // Una configuracion de seguridad entre headers
app.use(express.json()) // Parsea lo que llega al servidor en formato json
app.use(morgan('dev')) // Muestra en consola la url, tiempo y status solicitado

// Iniciar rutas
initRoutes(app)

module.exports = {
  PORT,
  app
}
