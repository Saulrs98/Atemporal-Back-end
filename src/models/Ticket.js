import { knex } from '../db'

const Ticket = {
  getAll: () => {
    return knex.select().table('boletos').where('esta_activo', 1)
  },
  getOne: (id) => {
    return knex.select().table('boletos').where('id_boleto', id).where('esta_activo', 1)
  },
  postOne: (data) => {
    return knex('boletos').insert(data)
  },
  updateOne: (id, data) => { // data = {}
    return knex('boletos').where('id_boleto', id).update(data)
  },
  deleteOne: (id) => { // data = {}
    return knex('boletos').where('id_boleto', id).update({ esta_activo: false })
  }
}

module.exports = { Ticket }
