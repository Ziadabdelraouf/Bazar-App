package com.example.bazar_group_1

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import com.google.firebase.FirebaseApp
import com.google.firebase.appcheck.FirebaseAppCheck
import com.google.firebase.appcheck.debug.DebugAppCheckProviderFactory
import com.google.firebase.appcheck.debug.internal.StorageHelper

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        if (applicationInfo.flags and android.content.pm.ApplicationInfo.FLAG_DEBUGGABLE != 0) {
            val token = getDebugToken()
            if (token != null) {
                val app = FirebaseApp.getInstance()
                val storageHelper = StorageHelper(
                    app.applicationContext,
                    app.persistenceKey
                )
                storageHelper.saveDebugSecret(token)
            }

            FirebaseAppCheck.getInstance().installAppCheckProviderFactory(
                DebugAppCheckProviderFactory.getInstance()
            )
        }
    }

    private fun getDebugToken(): String? {
        try {
            val assetKey = io.flutter.FlutterInjector.instance().flutterLoader().getLookupKeyForAsset(".env")
            assets.open(assetKey).use { inputStream ->
                java.io.BufferedReader(java.io.InputStreamReader(inputStream)).use { reader ->
                    var line: String?
                    while (reader.readLine().also { line = it } != null) {
                        val trimmed = line?.trim() ?: ""
                        if (trimmed.startsWith("APP_CHECK_DEBUG_TOKEN=")) {
                            val tokenValue = trimmed.substringAfter("APP_CHECK_DEBUG_TOKEN=").trim()
                            if (tokenValue.isNotEmpty()) {
                                return tokenValue
                            }
                        }
                    }
                }
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
        return null
    }
}