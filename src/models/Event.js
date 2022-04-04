import { knex } from '../db'

const Event = {
  getAll: () => {
    return knex.select().table('eventos').where('esta_activo', 1)
  },
  getOne: (id) => {
    return knex.select().table('eventos').where('id_evento', id).where('esta_activo', 1)
  },
  postOne: (data) => {
    return knex('eventos').insert(data)
  },
  updateOne: (id, data) => { // data = {}
    return knex('eventos').where('id_evento', id).update(data)
  },
  deleteOne: (id) => { // data = {}
    return knex('evento').where('id_evento', id).update({ esta_activo: false })
  }
}

module.exports = { Event }
