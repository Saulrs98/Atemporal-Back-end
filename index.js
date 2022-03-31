const { PORT, app } = require('./src/app')
const colors = require('colors')

function main() {
  app.listen(PORT, () => {
    console.log(`Example app listening on port ${PORT
      }`.bgWhite.red)
  })
}

main()
