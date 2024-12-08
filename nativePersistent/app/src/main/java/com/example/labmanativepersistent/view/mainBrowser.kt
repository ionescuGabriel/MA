package com.example.labmanativepersistent.view

import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.interaction.collectIsPressedAsState
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material3.Card
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavHostController
import com.example.labmanativepersistent.modelAdaptor.albumViewModel
import com.example.labmanativepersistent.model.album
import com.example.labmanativepersistent.modelAdaptor.albumSelectModel
import androidx.compose.runtime.collectAsState

@Composable
fun mainBrowser(navController: NavHostController, viewModel: albumViewModel, albumSelectModel: albumSelectModel) {
    val albums by viewModel.allAlbumsSorted.collectAsState(initial = emptyList())
    var selectedAlbum by remember { mutableStateOf<album?>(null) }
    var deleteConfirmation by remember { mutableStateOf(false) }

    LazyColumn{
        item {
            Text(
                text = "Album Browser",
                modifier = Modifier.fillMaxWidth(),
                textAlign = TextAlign.Center,
                fontSize = 40.sp
            )
        }

        item {
            Row(modifier = Modifier.fillMaxWidth(), horizontalArrangement = Arrangement.Center)
            {
                IconButton(
                    onClick = { navController.navigate(browser.onCreate) },
                    modifier = Modifier
                        .padding(5.dp)
                        .size(40.dp)
                )
                {
                    Icon(
                        imageVector = Icons.Default.Add,
                        contentDescription = "Add Album",
                        modifier = Modifier.size(35.dp)
                    )
                }
            }
        }

        albums.forEach { album ->
            item {
                Album(
                    album = album,
                    onItemClick =
                    {
                        albumSelectModel.selectAlbumId = album.id
                        navController.navigate("onSpecifics")
                    },
                    onDeleteClick =
                    {
                        selectedAlbum = album
                        deleteConfirmation = true
                    }
                )

                if (deleteConfirmation && album == selectedAlbum)
                {
                    deleteDialog(
                        onDeleteConfirmed =
                        {
                            selectedAlbum?.let { album ->
                                viewModel.deleteAlbum(album.id)
                            }
                            selectedAlbum = null
                            deleteConfirmation = false
                        },
                        onCancel =
                        {
                            selectedAlbum = null
                            deleteConfirmation = false
                        }
                    )
                }
            }
        }
    }
}

@Composable
fun Album(album: album, onItemClick: () -> Unit, onDeleteClick: () -> Unit)
{
    val interactionSource = remember { MutableInteractionSource() }
    val isPressed by interactionSource.collectIsPressedAsState()

    val backgroundColor = if (album.listen) Color.Green else Color.Red

    Card(
        modifier = Modifier.fillMaxWidth().padding(8.dp).clickable(interactionSource = interactionSource, indication = null)
        {
            if (isPressed)
            {
                onDeleteClick()
            }
            else
            {
                onItemClick()
            }
        }
    )
    {
        Surface(
            modifier = Modifier.fillMaxSize(),
            color = if (isPressed) Color(0xF63F0000) else backgroundColor
        )
        {
            Column(modifier = Modifier.padding(12.dp).fillMaxWidth())
            {
                Text(text = album.title, fontSize = 20.sp, fontWeight = FontWeight.Bold)
                Spacer(modifier = Modifier.height(8.dp))

                Text("By ${album.artist}")
                Text("Rating: ${album.rating}")
            }
        }
    }
}