import { knex } from '../db'

const User = {
  getAll: () => {
    return knex.select().table('usuarios')
  },
  getOne: (id) => {
    return knex.select().table('usuarios').where('id_usuario', id)
  },
  postOne: (data) => {
    return knex('usuarios').insert(data)
  },
  updateOne: (id, data) => { // data = {}
    return knex('usuarios').where('id_usuario', id).update(data)
  }
}

module.exports = { User }
