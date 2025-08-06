
package com.jayapps.app_permission_tracker

import android.Manifest
import android.content.pm.PackageManager
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class AppPermissionTrackerPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: android.content.Context

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        channel = MethodChannel(binding.binaryMessenger, "app_permission_tracker")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "checkPermissionStatus") {
            val type = call.argument<String>("permissionType") ?: ""
            val status = getPermissionStatus(type)
            result.success(status)
        } else {
            result.notImplemented()
        }
    }

    private fun getPermissionStatus(type: String): String {
        val permission = when (type) {
            "camera" -> Manifest.permission.CAMERA
            "location" -> Manifest.permission.ACCESS_FINE_LOCATION
            "microphone" -> Manifest.permission.RECORD_AUDIO
            "contacts" -> Manifest.permission.READ_CONTACTS
            "calendar" -> Manifest.permission.READ_CALENDAR
            "sms" -> Manifest.permission.READ_SMS
            "storage" -> Manifest.permission.READ_EXTERNAL_STORAGE
            "phone" -> Manifest.permission.READ_PHONE_STATE
            "bodySensors" -> Manifest.permission.BODY_SENSORS
            else -> return "unsupported"
        }
        return if (ContextCompat.checkSelfPermission(context, permission) == PackageManager.PERMISSION_GRANTED) {
            "granted"
        } else {
            "denied"
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
