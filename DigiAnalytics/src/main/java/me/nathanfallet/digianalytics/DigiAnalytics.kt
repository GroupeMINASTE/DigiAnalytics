package me.nathanfallet.digianalytics

import android.content.Context
import me.nathanfallet.apirequest.request.APIConfiguration
import me.nathanfallet.apirequest.request.APIRequest
import me.nathanfallet.apirequest.request.APIResponseStatus
import me.nathanfallet.digianalytics.helpers.Device
import me.nathanfallet.digianalytics.helpers.IntDecoder
import org.json.JSONObject

// Base URL for DigiAnalytics website (ending by a /)
class DigiAnalytics(var baseURL: String) {

    // Properties

    // Configuration to fetch API
    private val apiConfiguration = APIConfiguration(
        "digianalytics.fr",
        "https",
        443
    ).apply {
        headers = {
            val headers = HashMap<String, String>()
            headers["User-Agent"] = Device.userAgent()
            headers
        }
        decoder = IntDecoder()
    }

    // Last sent page (for reffer)
    private var lastRequest: String? = null

    // Set a custom referrer
    var referrer: String? = null

    // Methods

    @JvmOverloads
    fun send(path: String, context: Context, completionHandler: ((APIResponseStatus) -> Unit)? = null) {
        // Build the body
        val body = JSONObject()
        body.put("page", "$baseURL$path")
        body.put("screen_resolution", Device.screenResolution(context))
        body.put("event", null)
        body.put("referrer", referrer ?: lastRequest)

        // Send the request
        APIRequest("POST", "/api/event", apiConfiguration)
            .withBody(body)
            .execute { data, status ->
                // Complete the request
                (data as? Int)?.let {
                    if (it == status.code) {
                        completionHandler?.invoke(status)
                    } else {
                        completionHandler?.invoke(APIResponseStatus.status(data))
                    }
                } ?: run {
                    completionHandler?.invoke(status)
                }
            }

        // Save this request
        lastRequest = baseURL + path
        referrer = null
    }

}