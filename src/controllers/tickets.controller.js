import { Ticket } from '../models/Ticket'

export const ticketController = {
  getAll: async (req, res) => {
    try {
      const tickets = await Ticket.getAll()
      res.json(tickets)
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  },
  getOne: async (req, res) => {
    try {
      const tickets = await Ticket.getOne(req.params.id)
      res.json(tickets[0])
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  },
  postOne: async (req, res) => {
    try {
      console.log(req.body)
      const resp = await Ticket.postOne(req.body)
      res.json(resp[0])
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  },
  updateOne: async (req, res) => {
    try {
      console.log(req.body)
      const resp = await Ticket.updateOne(req.params.id, req.body)
      res.json({ rows_affected: resp })
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  },
  deleteOne: async (req, res) => {
    try {
      const resp = await Ticket.deleteOne(req.params.id)
      res.json({ rows_affected: resp })
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  }
}
