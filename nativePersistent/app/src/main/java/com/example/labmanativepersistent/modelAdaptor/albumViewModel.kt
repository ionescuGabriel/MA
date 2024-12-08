package com.example.labmanativepersistent.modelAdaptor

import com.example.labmanativepersistent.model.albumDao
import com.example.labmanativepersistent.model.album
import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.*
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.ExperimentalCoroutinesApi

@OptIn(ExperimentalCoroutinesApi::class)
class albumViewModel ( private val dao: albumDao): ViewModel()
{
    val allAlbums: Flow<List<album>> = dao.getAlbums()
    val allAlbumsSorted: Flow<List<album>> = dao.getAlbumSortedByListen()

    private val _selectedAlbum = MutableStateFlow<album?>(null)
    val selectedAlbum: StateFlow<album?> = _selectedAlbum.asStateFlow()

    fun loadAlbumById(albumId: Int)
    {
        viewModelScope.launch {
            _selectedAlbum.value = dao.getAlbumById(albumId)
        }
    }

    suspend fun getAlbumById(albumId: Int): album?
    {
        return dao.getAlbumById(albumId)
    }

    fun addAlbum(newAlbum: album)
    {
        viewModelScope.launch {
            dao.insertAlbum(newAlbum)
        }
    }

    fun updateAlbum(updatedAlbum: album)
    {
        viewModelScope.launch {
            dao.updateAlbum(updatedAlbum)
        }
    }

    fun deleteAlbum(albumId: Int)
    {
        viewModelScope.launch {
            val album = dao.getAlbumById(albumId)
            album?.let {
                dao.deleteAlbum(it)
            }
        }
    }
}