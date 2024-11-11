package com.example.albumlist

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import com.example.albumlist.modelAdaptor.albumViewModel
import com.example.albumlist.ui.theme.AlbumListTheme
import com.example.albumlist.view.browserInit

class MainActivity : ComponentActivity() {
    private val viewModel = albumViewModel()

    override fun onCreate(savedInstanceState: Bundle?)
    {
        super.onCreate(savedInstanceState)
        setContent{
            AlbumListTheme {
                browserInit(viewModel)
            }
        }
    }
}