package com.example.albumlist.modelAdaptor

import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.snapshots.SnapshotStateList
import androidx.lifecycle.ViewModel
import com.example.albumlist.model.album
import java.util.concurrent.atomic.AtomicInteger

class albumViewModel : ViewModel() {
    private var albums = mutableStateListOf<album>()
    private val uniqueId = AtomicInteger(100)

    fun getAlbums(): SnapshotStateList<album>
    {
        return albums
    }

    fun getAlbumById(albumID: Int): album
    {
        val index = albums.indexOfFirst { it.id == albumID }
        return albums[index]
    }

    fun addAlbum(album: album)
    {
        val newAlbum = album.copy(id = uniqueId.getAndIncrement())
        albums.add(newAlbum)
    }

    fun updateAlbum(album: album)
    {
        val index = albums.indexOfFirst { it.id == album.id }
        if (index != -1)
            albums[index] = album
    }

    fun deleteAlbum(albumId: Int)
    {
        albums.removeIf{it.id == albumId}
    }

    init{
        val initAlbums =listOf(
            album(
                id = 1,
                title = "The Bravery",
                artist = "The Bravery",
                rating = "47",
                release = 2005,
                genre = "Indie Rock, Dance-Punk",
                listen = true
            ),
            album(
                id = 2,
                title = "Pleasure to Kill",
                artist = "Kreator",
                rating = "88",
                release = 1986,
                genre = "Thrash Metal, Speed Metal",
                listen = true
            ),
            album(
                id = 3,
                title = "Franz Ferdinand",
                artist = "Franz Ferdinand",
                rating = "71",
                release = 2004,
                genre = "Dance Rock, Indie Rock",
                listen = true
            ),
            album(
                id = 4,
                title = "The Slow Rush",
                artist = "Tame Impala",
                rating = "-",
                release = 2020,
                genre = "Rock, Neo-Psychedelic",
                listen = false
            ),
            album(
                id = 5,
                title = "Summer In Abaddon",
                artist = "Pinback",
                rating = "67",
                release = 2004,
                genre = "Indie Rock, Emo",
                listen = true
            ),
            album(
                id = 6,
                title = "War Room Stories",
                artist = "BretonLabs",
                rating = "68",
                release = 2014,
                genre = "Indie Pop, Electronic Rock",
                listen = true
            ),
            album(
                id = 7,
                title = "Omega",
                artist = "Epica",
                rating = "-",
                release = 2021,
                genre = "Gothic Symphonic Metal, Power Metal, Opera Metal",
                listen = false
            ),
            album(
                id = 8,
                title = "Veneer",
                artist = "Jose Gonzalez",
                rating = "79",
                release = 2006,
                genre = "Indie Folk, Chamber Pop",
                listen = true
            ),
            album(
                id = 9,
                title = "Mechanical Bull",
                artist = "Kings Of Leon",
                rating = "61",
                release = 2013,
                genre = "Modern Rock, Garage Rock Revival",
                listen = true
            ),
            album(
                id = 10,
                title = "Hummingbird",
                artist = "Local Natives",
                rating = "-",
                release = 2013,
                genre = "Shimmer Pop, Indie Rock, Chamber Pop",
                listen = false
            )
        )
        albums.addAll(initAlbums)
    }
}