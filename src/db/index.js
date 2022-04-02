import config from '../config'
export const knex = require('knex')({
  client: 'mysql',
  connection: {
    host: config.databaseConfig.host,
    port: config.databaseConfig.port,
    user: config.databaseConfig.user,
    password: config.databaseConfig.password,
    database: config.databaseConfig.database
  },
  pool: {
    min: 0,
    max: 7
  },
  log: {
    warn (message) {
      console.warn(message)
    },
    error (message) {
      console.error(message)
    },
    deprecate (message) {
      console.warn(message)
    },
    debug (message) {
      console.info(message)
    }
  }
})
