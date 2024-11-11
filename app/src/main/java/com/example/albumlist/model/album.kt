package com.example.albumlist.model

data class album (

    val id: Int,
    var title: String,
    var artist: String,
    var rating: String,
    var release: Int,
    var genre: String,
    var listen: Boolean
)