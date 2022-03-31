export const knex = require('knex')({
  client: 'mysql',
  connection: {
    host: '127.0.0.1',
    port: 3307,
    user: 'atemporal',
    password: 'Atemporal1',
    database: 'atemporal'
  },
  pool: { min: 0, max: 7 }
})
