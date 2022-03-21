package me.nathanfallet.digianalytics.helpers

import android.content.Context
import android.content.pm.PackageInfo
import android.os.Build


class App {

    companion object {

        @JvmStatic
        fun id(context: Context): String {
            return context.packageName
        }

        @JvmStatic
        fun version(context: Context): String {
            val pInfo: PackageInfo = context.packageManager.getPackageInfo(context.packageName, 0)
            return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                pInfo.longVersionCode.toString()
            } else {
                pInfo.versionCode.toString()
            }
        }

    }

}