const express = require("express")
const auth = require("../middleware/auth")

const {
  getAllVideoTapes,
  getVideoTapeById,
  createVideoTape, 
  updateVideoTape,
  deleteVideoTape,
} = require("../controllers/videoTapeController")

const router = express.Router()

router.get("/", getAllVideoTapes)
router.get("/:id", getVideoTapeById)

router.post("/", auth, createVideoTape)
router.put("/:id", auth, updateVideoTape) 
router.delete("/:id", auth, deleteVideoTape)

module.exports = router