package com.example.labmanativepersistent.view

import androidx.compose.material3.AlertDialog
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable

@Composable
fun deleteDialog(onDeleteConfirmed: () -> Unit, onCancel: () -> Unit)
{
    AlertDialog(
        onDismissRequest = onCancel,
        title = { Text("Delete Album?") },
        confirmButton =
        {
            Button(onClick = onDeleteConfirmed)
            {
                Text("Yes")
            }
        },
        dismissButton =
        {
            Button(onClick = onCancel)
            {
                Text("No")
            }
        }
    )
}