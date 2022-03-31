const { User } = require('../models/User')

const userController = {
  getAll: (req, res) => {
    User.getAll()
      .then(resp => {
        console.log(resp.data)
        res.json({ msg: resp.data.results })// /usuarios/
      })
      .catch(e => {
        console.log(e)
      })
  }
}

module.exports = { userController }
