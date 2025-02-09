const express = require("express")
const multer = require("multer")
const cors = require("cors")
const path = require("path")
const fs = require("fs")
require("dotenv").config()
const db = require("./config/db")
const authRoutes = require("./routes/authRoutes")
const videoTapeRoutes = require("./routes/videoTapeRoutes")
const app = express()

const uploadsDir = path.join(__dirname, "../assets/images")
if (!fs.existsSync(uploadsDir)) {
  fs.mkdirSync(uploadsDir, { recursive: true })
}

const storage = multer.diskStorage({
  destination: function(req, file, cb) {
    cb(null, uploadsDir)
  },
  filename: function(req, file, cb) {
    const ext = path.extname(file.originalname)
    const filename = `${Date.now()}${ext}`
    cb(null, filename)
  }
})

const upload = multer({ storage: storage })

app.use(cors())
app.use(express.json())

app.use("/api/auth", authRoutes)
app.use("/api/videotapes", videoTapeRoutes)
app.use("/uploads", express.static(path.join(__dirname, "../assets/images")))

app.post("/api/upload", upload.single("image"), (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({ error: "No file uploaded" })
    }

    const imageUrl = `/uploads/${req.file.filename}`
    res.json({ url: imageUrl })
  } catch (error) {
    console.error("Upload error:", error)
    res.status(500).json({ error: error.message })
  }
})

app.post("/api/register-existing-image", (req, res) => {
  try {
    const { filename } = req.body;
    const imageUrl = `/uploads/${filename}`;
    
    const filePath = path.join(__dirname, "../assets/images", filename);
    if (!fs.existsSync(filePath)) {
      return res.status(404).json({ error: "File not found" });
    }

    res.json({ url: imageUrl });
  } catch (error) {
    console.error("Register image error:", error);
    res.status(500).json({ error: error.message });
  }
});

app.get("/api/test", async (req, res) => {
  try {
    const [rows] = await db.query("SELECT 1 + 1 AS result") 
    res.json({
      message: "Backend is working!",
      dbConnection: "Database connected successfully",
      result: rows[0].result
    })
  } catch (error) {
    res.status(500).json({
      message: "Error connecting to database",
      error: error.message
    })
  }
})

const PORT = process.env.PORT || 3000
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`)
})