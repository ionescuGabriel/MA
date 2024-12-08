package com.example.labmanativepersistent

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import com.example.labmanativepersistent.modelAdaptor.albumViewModel
import com.example.labmanativepersistent.ui.theme.AlbumListTheme
import com.example.labmanativepersistent.view.browserInit
import androidx.room.Room
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.activity.viewModels
import com.example.labmanativepersistent.model.albumDatabase

class MainActivity : ComponentActivity()
{
    private val db by lazy {
        Room.databaseBuilder(
            applicationContext,
            albumDatabase::class.java,
            "album.db"
        ).build()
    }

    private val viewModel by viewModels<albumViewModel>(
        factoryProducer =
        {
            object : ViewModelProvider.Factory
            {
                override fun <T : ViewModel> create(modelClass: Class<T>): T
                {
                    return albumViewModel(db.dao) as T
                }
            }
        }
    )

    override fun onCreate(savedInstanceState: Bundle?)
    {
        super.onCreate(savedInstanceState)
        setContent {
            AlbumListTheme {
                browserInit(viewModel)
            }
        }
    }
}