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
    max: 7,
    afterCreate: function (conn, done) {
      // in this example we use pg driver's connection API
      conn.query('SET timezone="UTC";', function (err) {
        if (err) {
          // first query failed, return error and don't try to make next query
          done(err, conn)
        } else {
          // do the second query...
          conn.query('SELECT set_limit(0.01);', function (err) {
            // if err is not falsy, connection is discarded from pool
            // if connection aquire was triggered by a query the error is passed to query promise
            done(err, conn)
          })
        }
      })
    }
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
