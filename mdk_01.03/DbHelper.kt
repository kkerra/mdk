package com.example.databaseapp

import android.content.ClipDescription
import android.content.ContentValues
import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper

class DbHelper(context: Context) : SQLiteOpenHelper(context, "items_db", null, 1) {
    override fun onCreate(db: SQLiteDatabase) {
        val query = ("CREATE TABLE items (" +
                     "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                     "name TEXT, " +
                     "description TEXT, " +
                     "price REAL)")

        db.execSQL(query)
    }

    override fun onUpgrade(db: SQLiteDatabase, oldVersion: Int, newVersion: Int) {
        db.execSQL("DROP TABLE IF EXISTS items")
        onCreate(db)
    }

    fun addItem(item: Item){
        val db = this.writableDatabase

        val values = ContentValues()

        values.put("name", item.name)
        values.put("description", item.description)
        values.put("price", item.price)

        db.insert("items", null, values)

        db.close()
    }

    fun getItems() : List<Item>{
        val db = this.readableDatabase

        val data = db.rawQuery("SELECT * FROM items", null)

        val items : MutableList<Item> = mutableListOf()

        while (data.moveToNext()){
            items.add(Item(
                id = data.getInt(0),
                name = data.getString(1),
                description = data.getString(2),
                price = data.getDouble(3)))
        }

        return items
    }

    fun deleteItem(id:Int){
        val db = this.writableDatabase

        db.execSQL("DELETE FROM items WHERE id = ?", arrayOf(id) )

        db.close()
    }
}

data class Item(
    val id: Int = 0,
    val name: String,
    val description: String,
    val price: Double
)