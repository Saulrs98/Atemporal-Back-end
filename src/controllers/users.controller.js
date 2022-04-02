import { User } from '../models/User'

export const userController = {
  getAll: async (req, res) => {
    try {
      const users = await User.getAll()
      res.json(users)
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  },
  getOne: async (req, res) => {
    try {
      const user = await User.getOne(req.params.id)
      res.json(user[0])
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  },
  postOne: async (req, res) => {
    try {
      console.log(req.body)
      const resp = await User.postOne(req.body)
      res.json(resp[0])
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  },
  putOne: async (req, res) => {
    try {
      console.log(req.body)
      const resp = await User.updateOne(req.params.id, req.body)
      res.json({ rows_affected: resp })
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  }
}
