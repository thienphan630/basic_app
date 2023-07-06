package com.example.basic_app

import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "flutter.showToast"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, res ->
            val message: String = call.argument<String>("message").toString()
            val showTime: Int = call.argument<Int>("showTime")?.toInt() ?: Toast.LENGTH_SHORT

            if (call.method.equals("show_toast")) {
                Toast.makeText(context, message + "time: " + showTime, showTime).show()
            } else {
                res.notImplemented()
            }
        }
    }
}
