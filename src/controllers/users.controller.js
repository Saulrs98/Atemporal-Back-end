import { User } from '../models/User'

const userController = {
  getAll: async (req, res) => {
    try {
      const users = await User.getAll()
      res.json({ data: users })
    } catch (error) {
      console.log(error)
      res.json({ msg: 'error' })
    }
  }
}

module.exports = { userController }
