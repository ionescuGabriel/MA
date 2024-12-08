package com.example.labmanativepersistent.model

import androidx.room.*
import kotlinx.coroutines.flow.Flow

@Dao
interface albumDao
{
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAlbum(album: album)

    @Update
    suspend fun updateAlbum(album: album)

    @Delete
    suspend fun deleteAlbum(album: album)

    @Query("SELECT * FROM album")
    fun getAlbums(): Flow<List<album>>

    @Query("SELECT * FROM album WHERE id = :albumId")
    suspend fun getAlbumById(albumId: Int): album

    @Query("SELECT * FROM album ORDER BY listen")
    fun getAlbumSortedByListen(): Flow<List<album>>
}