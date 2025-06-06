const db = require("../config/db")

const getAllVideoTapes = async (req, res) => {
  try {
    const [videoTapes] = await db.query(`
      SELECT v.*, g.name as genre_name, 
      GROUP_CONCAT(vi.image_url) as image_urls
      FROM video_tapes v 
      LEFT JOIN genres g ON v.genre_id = g.id
      LEFT JOIN video_tape_images vi ON v.id = vi.video_tape_id
      GROUP BY v.id
    `)

    const formattedTapes = videoTapes.map((tape) => ({
      id: tape.id,
      title: tape.title,
      price: tape.price,
      description: tape.description,
      genreId: tape.genre_id,
      genreName: tape.genre_name,
      level: tape.level,
      stockQuantity: tape.stock_quantity,
      rating: tape.rating,
      totalReviews: tape.total_reviews,
      imageUrls: tape.image_urls ? tape.image_urls.split(",") : [],
      createdAt: tape.created_at
    }))

    res.json(formattedTapes)
  } catch (error) {
    console.error("Get video tapes error:", error)
    res.status(500).json({ message: "Server error" })
  }
}

const getVideoTapeById = async (req, res) => {
  try {
    const [videoTapes] = await db.query(
      `SELECT v.*, g.name as genre_name, 
      GROUP_CONCAT(vi.image_url) as image_urls
      FROM video_tapes v 
      LEFT JOIN genres g ON v.genre_id = g.id
      LEFT JOIN video_tape_images vi ON v.id = vi.video_tape_id
      WHERE v.id = ?
      GROUP BY v.id`,
      [req.params.id]
    )

    if (videoTapes.length === 0) {
      return res.status(404).json({ message: "Video tape not found" })
    }

    const tape = videoTapes[0]
    const formattedTape = {
      id: tape.id,
      title: tape.title,
      price: tape.price,
      description: tape.description, 
      genreId: tape.genre_id,
      genreName: tape.genre_name,
      level: tape.level,
      stockQuantity: tape.stock_quantity,
      rating: tape.rating,
      totalReviews: tape.total_reviews,
      imageUrls: tape.image_urls ? tape.image_urls.split(",") : [],
      createdAt: tape.created_at
    }

    res.json(formattedTape)
  } catch (error) {
    console.error("Get video tape error:", error)
    res.status(500).json({ message: "Server error" })
  }
}

const createVideoTape = async (req, res) => {
  try {
    const { title, price, description, genreId, level, stockQuantity, imageUrls, rating } = req.body
    
    if (!title || !price || !description || !genreId || !level || !stockQuantity) {
      return res.status(400).json({ message: "All fields are required" })
    }

    const [result] = await db.query(
      "INSERT INTO video_tapes (title, price, description, genre_id, level, stock_quantity, rating) VALUES (?, ?, ?, ?, ?, ?, ?)",
      [title, price, description, genreId, level, stockQuantity, rating]
    )

    if (imageUrls && imageUrls.length > 0) {
      const imageValues = imageUrls.map((url, index) => [
        result.insertId,
        url.replace(/^https?:\/\/[^\/]+/, ""),
        index === 0
      ])
      
      await db.query(
        "INSERT INTO video_tape_images (video_tape_id, image_url, is_primary) VALUES ?",
        [imageValues]
      )
    }

    res.status(201).json({
      message: "Video tape created successfully",
      id: result.insertId
    })
  } catch (error) {
    console.error("Create video tape error:", error)
    res.status(500).json({ message: "Server error" })
  }
}

const updateVideoTape = async (req, res) => {
  try {
    const { title, price, description, genreId, level, stockQuantity, imageUrls, rating } = req.body
    const { id } = req.params

    await db.query(
      `UPDATE video_tapes 
       SET title = ?, price = ?, description = ?, 
           genre_id = ?, level = ?, stock_quantity = ?, rating = ?
       WHERE id = ?`,
      [title, price, description, genreId, level, stockQuantity, rating, id]
    )

    if (imageUrls && imageUrls.length > 0) {
      await db.query("DELETE FROM video_tape_images WHERE video_tape_id = ?", [id])

      const imageValues = imageUrls.map((url, index) => [id, url, index === 0])
      await db.query(
        "INSERT INTO video_tape_images (video_tape_id, image_url, is_primary) VALUES ?",
        [imageValues]
      )
    }

    res.json({ message: "Video tape updated successfully" })
  } catch (error) {
    console.error("Update video tape error:", error)
    res.status(500).json({ message: "Server error" })
  }
}

const deleteVideoTape = async (req, res) => {
  try {
    const { id } = req.params

    await db.query("DELETE FROM video_tape_images WHERE video_tape_id = ?", [id])
    await db.query("DELETE FROM video_tapes WHERE id = ?", [id])

    res.json({ message: "Video tape deleted successfully" })
  } catch (error) {
    console.error("Delete video tape error:", error)
    res.status(500).json({ message: "Server error" })
  }
}

module.exports = {
  getAllVideoTapes,
  getVideoTapeById, 
  createVideoTape,
  updateVideoTape,
  deleteVideoTape
}