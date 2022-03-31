const routerUser = require('./users.routes')

const initRoutes = (app) => {
  app.use('/usuarios', routerUser)
}

module.exports = { initRoutes }
