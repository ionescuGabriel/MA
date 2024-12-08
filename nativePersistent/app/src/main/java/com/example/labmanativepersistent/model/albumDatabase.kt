package com.example.labmanativepersistent.model

import androidx.room.Database
import androidx.room.RoomDatabase

@Database(
    entities = [album::class],
    version = 1
)

abstract class albumDatabase : RoomDatabase()
{
    abstract val dao: albumDao
}