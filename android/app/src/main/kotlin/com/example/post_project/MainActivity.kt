package com.example.post_project

import androidx.annotation.NonNull
import com.yandex.mapkit.MapKitFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setLocale("uzblot")
    MapKitFactory.setApiKey("116fcf0d-3bdf-4a49-a146-3217d7742c86") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}
