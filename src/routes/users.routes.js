import { Router } from 'express'
import { userController } from '../controllers/users.controller'

const router = Router()

router.get('/', userController.getAll)
router.get('/:id', userController.getOne)

router.post('/', userController.postOne)
router.put('/:id', userController.putOne)

module.exports = router
