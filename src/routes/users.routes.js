import { Router } from 'express'
import { userController } from '../controllers/users.controller'

const router = Router()

router.get('/', userController.getAll)

router.get('/:id', (req, res) => { // /usuarios/id
  res.json({ msg: 'usuarios ID' })
})

module.exports = router
