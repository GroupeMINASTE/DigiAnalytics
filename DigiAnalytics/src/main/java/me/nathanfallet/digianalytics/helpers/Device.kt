package me.nathanfallet.digianalytics.helpers

import android.content.Context
import android.os.Build
import android.util.DisplayMetrics
import android.view.WindowManager
import android.view.WindowMetrics


class Device {

    companion object {

        @JvmStatic
        fun userAgent(): String {
            return "Mozilla/5.0 (Linux; ${name()} ${osVersion()}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36"
        }

        @JvmStatic
        fun name(): String {
            return "Android"
        }

        @JvmStatic
        fun osVersion(): String {
            return Build.VERSION.RELEASE
        }

        @JvmStatic
        fun screenResolution(context: Context): String {
            return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                val bounds = (context.getSystemService(Context.WINDOW_SERVICE) as? WindowManager)?.currentWindowMetrics?.bounds
                "${bounds?.width()}x${bounds?.height()}"
            } else {
                val display = (context.getSystemService(Context.WINDOW_SERVICE) as? WindowManager)?.defaultDisplay
                val metrics = DisplayMetrics()
                display?.getMetrics(metrics)
                val width = metrics.widthPixels
                val height = metrics.heightPixels
                "${width}x${height}"
            }
        }

    }

}