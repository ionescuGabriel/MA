package com.example.labmanativepersistent.view

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Edit
import androidx.compose.material3.Card
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavHostController
import com.example.labmanativepersistent.modelAdaptor.albumViewModel
import com.example.labmanativepersistent.modelAdaptor.albumSelectModel
import androidx.compose.runtime.*
import androidx.compose.ui.text.TextStyle

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun specifics(viewModel: albumViewModel, albumSelectModel: albumSelectModel, navController: NavHostController){
    val selectAlbumId = albumSelectModel.selectAlbumId
    val album by viewModel.selectedAlbum.collectAsState()

    LaunchedEffect(selectAlbumId)
    {
        viewModel.loadAlbumById(selectAlbumId) // Trigger loading the album
    }

    val boldTextStyle = TextStyle(fontSize = 22.sp, fontWeight = FontWeight.Bold)

    Column(modifier = Modifier.fillMaxSize().padding(22.dp))
    {
        TopAppBar(
            title = { Text("Album Specifics") },
            navigationIcon =
            {
                IconButton(onClick = { navController.popBackStack() })
                {
                    Icon(imageVector = Icons.Default.ArrowBack, contentDescription = "Back", modifier = Modifier.size(30.dp))
                }
            },
            actions =
            {
                IconButton(onClick = { navController.navigate(browser.onUpdate) })
                {
                    Icon(imageVector = Icons.Default.Edit, contentDescription = "Update", modifier = Modifier.size(24.dp))
                }
            }
        )

        album?.let { currentAlbum ->
            Text(
                text = "\"${currentAlbum.title}\"",
                modifier = Modifier.fillMaxWidth().padding(top = 40.dp),
                fontSize = 22.sp,
                textAlign = TextAlign.Center,
                fontWeight = FontWeight.Bold,
            )

            Surface(modifier = Modifier.fillMaxWidth(), color = Color.White) {
                Card(modifier = Modifier.padding(1.dp)) {
                    Column(
                        modifier = Modifier.padding(10.dp).fillMaxWidth(),
                        horizontalAlignment = Alignment.CenterHorizontally
                    )
                    {
                        Text("By: ${currentAlbum.artist}")
                        Text("Rating: ${currentAlbum.rating}")
                    }
                }
            }

            Spacer(modifier = Modifier.height(1.dp))
            Text(
                modifier = Modifier.fillMaxWidth(),
                textAlign = TextAlign.Center,
                text = "Genres:",
                style = boldTextStyle
            )
            currentAlbum.genre.split(",").forEach { genreEntry ->
                Row(
                    modifier = Modifier.padding(vertical = 1.dp),
                    verticalAlignment = Alignment.CenterVertically
                )
                {
                    Text(
                        text = genreEntry.trim().ifEmpty { "Why is this necessary?" },
                        textAlign = TextAlign.Center,
                        style = TextStyle(fontSize = 16.sp),
                        modifier = Modifier.padding(start = 8.dp).fillMaxWidth()
                    )
                }
            }

            Spacer(modifier = Modifier.height(1.dp))
            Text(
                modifier = Modifier.fillMaxWidth(),
                textAlign = TextAlign.Center,
                text = "Release:",
                style = boldTextStyle
            )
            Text(
                text = currentAlbum.release.toString(),
                modifier = Modifier.fillMaxWidth(),
                textAlign = TextAlign.Center,
                style = TextStyle(fontSize = 16.sp)
            )

            Spacer(modifier = Modifier.height(1.dp))
            Text(
                modifier = Modifier.fillMaxWidth(),
                textAlign = TextAlign.Center,
                text = "Status:",
                style = boldTextStyle
            )
            Text(
                text = if (currentAlbum.listen == true)
                {
                    "Completed"
                } else
                {
                    "On backlog"
                },
                modifier = Modifier.fillMaxWidth(),
                textAlign = TextAlign.Center,
                style = TextStyle(fontSize = 16.sp)
            )
        } ?: run {
            Text("Loading...", modifier = Modifier.fillMaxSize(), textAlign = TextAlign.Center)
        }
    }
}