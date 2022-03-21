package me.nathanfallet.digianalyticssample

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import me.nathanfallet.digianalytics.DigiAnalytics

class MainActivity : AppCompatActivity() {

    private val analytics = DigiAnalytics("https://demo.digianalytics.fr/")

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    override fun onResume() {
        super.onResume()

        analytics.send("home", this) {
            Log.d("DigiAnalyticsSample", it.toString())
        }
    }

}