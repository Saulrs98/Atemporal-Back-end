const routerUser = require('./users.routes')

const initRoutes = (app) => {
  console.log('init routes')
  app.use('/usuarios', routerUser)
}

module.exports = { initRoutes }
