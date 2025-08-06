package com.jayapps.app_permission_tracker

import android.content.Context
import android.content.pm.PackageManager
import android.Manifest
import androidx.core.app.ActivityCompat

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

/** AppPermissionTrackerPlugin */
class AppPermissionTrackerPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var context: Context
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        channel = MethodChannel(binding.binaryMessenger, "app_permission_tracker")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "checkPermissionStatus" -> {
                val permission = call.argument<String>("permission")
                val status = checkPermission(permission)
                result.success(status)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    private fun checkPermission(permissionName: String?): String {
        if (permissionName == null) return "unsupported"

        val permission = when (permissionName.lowercase()) {
            "camera" -> Manifest.permission.CAMERA
            "location" -> Manifest.permission.ACCESS_FINE_LOCATION
            "microphone" -> Manifest.permission.RECORD_AUDIO
            "contacts" -> Manifest.permission.READ_CONTACTS
            "calendar" -> Manifest.permission.READ_CALENDAR
            "sms" -> Manifest.permission.READ_SMS
            "storage" -> Manifest.permission.READ_EXTERNAL_STORAGE
            "phone" -> Manifest.permission.READ_PHONE_STATE
            "body_sensors" -> Manifest.permission.BODY_SENSORS
            else -> return "unsupported"
        }

        return if (ActivityCompat.checkSelfPermission(context, permission) == PackageManager.PERMISSION_GRANTED) {
            "granted"
        } else {
            "denied"
        }
    }
}
