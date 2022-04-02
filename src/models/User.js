import { knex } from '../db'

const User = {
  getAll: () => {
    return knex.select().table('usuarios').where('esta_activo', 1)
  },
  getOne: (id) => {
    return knex.select().table('usuarios').where('id_usuario', id).where('esta_activo', 1)
  },
  postOne: (data) => {
    return knex('usuarios').insert(data)
  },
  updateOne: (id, data) => { // data = {}
    return knex('usuarios').where('id_usuario', id).update(data)
  },
  deleteOne: (id) => { // data = {}
    return knex('usuarios').where('id_usuario', id).update({ esta_activo: false })
  }
}

module.exports = { User }
