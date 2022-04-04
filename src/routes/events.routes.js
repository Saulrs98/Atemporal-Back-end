import { Router } from 'express'
import { eventController } from '../controllers/events.controller'

const router = Router()

router.get('/', eventController.getAll)
router.get('/:id', eventController.getOne)

router.post('/', eventController.postOne)
router.put('/:id', eventController.updateOne)

router.delete('/:id', eventController.deleteOne)

module.exports = router
