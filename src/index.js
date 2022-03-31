import '@babel/polyfill'
import { PORT, app } from './app'
require('colors')

async function main () {
  await app.listen(PORT, () => {
    console.log(`Example app listening on port ${PORT}`.bgWhite.red)
  })
}

main()
