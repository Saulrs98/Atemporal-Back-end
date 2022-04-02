import { Router } from 'express'
import { userController } from '../controllers/users.controller'

const router = Router()

router.get('/', userController.getAll)
router.get('/:id', userController.getOne)

router.post('/', userController.postOne)

module.exports = router
