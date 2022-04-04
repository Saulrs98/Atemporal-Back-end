import { Router } from 'express'
import { ticketController } from '../controllers/tickets.controller'

const router = Router()

router.get('/', ticketController.getAll)
router.get('/:id', ticketController.getOne)

router.post('/', ticketController.postOne)
router.put('/:id', ticketController.updateOne)

router.delete('/:id', ticketController.deleteOne)

module.exports = router
