package com.example.albumlist.view

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.Button
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.RadioButton
import androidx.compose.material3.Snackbar
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import com.example.albumlist.model.album
import com.example.albumlist.modelAdaptor.albumViewModel

@Composable
fun toast(errorMessage: String?, onDismiss: () -> Unit)
{
    errorMessage?.let {
        Snackbar(
            action =
            {
                Button(onClick = { onDismiss() })
                {
                    Text("Ok")
                }
            }
        )
        {
            Text(it)
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun add(viewModel: albumViewModel, onRecipeCreated: () -> Unit, navController: NavHostController) {
    var title by remember { mutableStateOf("") }
    var artist by remember { mutableStateOf("") }
    var rating by remember { mutableStateOf("-") }
    var release by remember { mutableStateOf("") }
    var genre by remember { mutableStateOf("") }
    var listen by remember { mutableStateOf("true") }

    var isErr by remember { mutableStateOf(false) }
    var errMessage by remember { mutableStateOf<String?>(null) }

    Column(modifier = Modifier.fillMaxSize().padding(16.dp))
    {
        TopAppBar(
            title = { Text("Album Creation") },
            navigationIcon =
            {
                IconButton(
                    onClick =
                    {
                        navController.navigate(browser.onBrowse)
                    }
                )
                {
                    Icon(imageVector = Icons.Default.ArrowBack, contentDescription = "Back", modifier = Modifier.size(30.dp))
                }
            }
        )

        TextField(
            value = title,
            onValueChange = { title = it },
            label = { Text("Title") }
        )

        TextField(
            value = artist,
            onValueChange = { artist = it },
            label = { Text("Artist") }
        )

        TextField(
            value = rating,
            onValueChange = { rating = it },
            label = { Text("Rating (1-100)") }
        )

        TextField(
            value = release,
            onValueChange = { release = it },
            label = { Text("Release year") }
        )

        TextField(
            value = genre,
            onValueChange = { genre = it },
            label = { Text("Genres (comma separator)") }
        )

        Row(verticalAlignment = Alignment.CenterVertically) {
            RadioButton(
                selected = listen == "true",
                onClick = { listen = "true" }
            )
            Text("I've listened to this album")
        }

        Row(verticalAlignment = Alignment.CenterVertically) {
            RadioButton(
                selected = listen == "false",
                onClick = { listen = "false" }
            )
            Text("I plan to listen to this album")
        }

        Button(
            onClick =
            {

                if (title.isEmpty() || genre.isEmpty() || artist.isEmpty())
                {
                    isErr = true
                    errMessage = "title, genre and artist required"
                }
                else
                {
                    try
                    {
                        val releaseConverted = release.toInt()
                        if(releaseConverted < 0)
                        {
                            throw NumberFormatException()
                        }

                        val listenConverted = listen.toBoolean()

                        if(rating != "-"){
                            val ratingConverted = rating.toInt()
                            if(ratingConverted < 1 || ratingConverted > 100){
                                throw NumberFormatException()
                            }
                        }

                        val newAlbum = album(
                            id = 42,
                            title = title,
                            artist = artist,
                            rating = rating,
                            release = releaseConverted,
                            genre = genre,
                            listen = listenConverted
                        )
                        viewModel.addAlbum(newAlbum)
                        onRecipeCreated()
                    }
                    catch (e: NumberFormatException)
                    {
                        isErr = true
                        errMessage = "release must be a positive integer. rating must be between 1 and 100"
                    }
                }
            }
        )
        {
            Text("Add Album")
        }
        toast(errMessage)
        {
            isErr = false
            errMessage = null
        }
    }
}