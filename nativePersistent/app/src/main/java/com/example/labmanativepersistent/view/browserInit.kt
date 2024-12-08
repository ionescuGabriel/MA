package com.example.labmanativepersistent.view

import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.example.labmanativepersistent.modelAdaptor.albumViewModel
import com.example.labmanativepersistent.modelAdaptor.albumSelectModel

object browser
{
    const val onBrowse = "onBrowse"
    const val onSpecifics = "onSpecifics"
    const val onCreate = "onCreate"
    const val onUpdate = "onUpdate"
}

@Composable
fun browserInit(viewModel: albumViewModel)
{
    val navController = rememberNavController()
    val albumSelectModel = remember { albumSelectModel() }

    NavHost(navController = navController, startDestination = browser.onBrowse)
    {
        composable(browser.onBrowse)
        {
            mainBrowser(navController, viewModel, albumSelectModel)
        }
        composable(browser.onCreate)
        {
            add(viewModel, onRecipeCreated = {navController.popBackStack()}, navController)
        }
        composable(browser.onSpecifics)
        {
            specifics(viewModel, albumSelectModel, navController)
        }
        composable(browser.onUpdate)
        {
            update(viewModel, albumSelectModel, navController)
        }
    }
}