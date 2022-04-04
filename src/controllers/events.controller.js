import { Event } from '../models/Event'

export const eventController = {
  getAll: async (req, res) => {
    try {
      const events = await Event.getAll()
      res.json(events)
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  },
  getOne: async (req, res) => {
    try {
      const events = await Event.getOne(req.params.id)
      res.json(events[0])
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  },
  postOne: async (req, res) => {
    try {
      console.log(req.body)
      const resp = await Event.postOne(req.body)
      res.json(resp[0])
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  },
  updateOne: async (req, res) => {
    try {
      console.log(req.body)
      const resp = await Event.updateOne(req.params.id, req.body)
      res.json({ rows_affected: resp })
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  },
  deleteOne: async (req, res) => {
    try {
      const resp = await Event.deleteOne(req.params.id)
      res.json({ rows_affected: resp })
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  }
}
