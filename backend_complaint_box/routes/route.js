const express = require('express')
const controller = require('../controller/userController.js')
const router = express.Router()

// router.post('/admin/post_details' , controller.post_me)
// router.put('/update_details' , controller.post_details)
// router.get('/get_details/:id' , controller.get_details)
router.post('/add_complaint' , controller.add_complaint)
router.get('/get_complaints/:id' , controller.get_complaints_user)
router.get('/get_all_queries' , controller.get_all_queries)
router.put('/solve_query/:id' , controller.solve_query)
router.post('/create_user' , controller.sigin_user)
router.post('/login' , controller.login_user)
router.put('/accept_query/:id' , controller.accept_query)

module.exports = router;