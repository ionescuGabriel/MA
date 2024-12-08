package com.example.labmanativepersistent.model

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity
data class album (
    @PrimaryKey(autoGenerate = true)
    val id: Int = 0,
    val title: String,
    val artist: String,
    val rating: String,
    val release: Int,
    val genre: String,
    val listen: Boolean
)