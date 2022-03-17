const express = require("express")
const colors = require('colors');


const app = express()

const port = 4000


// undefined


app.get('/', (req, res) => {
  res.json({
    message: {
      otro: "Prueba de mensaje"
    }
  })
})
app.get('/hola', (req, res) => {
  res.send('Ruta hola')
})

app.get('/hola2', (req, res) => {
  res.send('Ruta hola2')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`.bgWhite.red)
})