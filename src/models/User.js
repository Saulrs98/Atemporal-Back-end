import { knex } from '../db'

const User = {
  getAll: () => {
    return knex.select().table('usuarios')
  }
}

module.exports = { User }
