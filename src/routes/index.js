import routerUser from './users.routes'

export const initRoutes = (app) => {
  app.use('/usuarios', routerUser)
}
