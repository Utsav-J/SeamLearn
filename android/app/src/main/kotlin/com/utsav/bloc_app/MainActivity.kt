package com.utsav.bloc_app

// import io.flutter.embedding.android.FlutterActivity
// import android.os.Bundle;

// class MainActivity: FlutterActivity() {
//     override fun onCreate(savedInstanceState: Bundle?) {
//         super.onCreate(savedInstanceState)

//         // Add this line to set the https.protocols system property
//         System.setProperty("https.protocols", "TLSv1")
//     }
// }

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Add this line to set the https.protocols system property
        System.setProperty("https.protocols", "TLSv1")

        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))
    }
}