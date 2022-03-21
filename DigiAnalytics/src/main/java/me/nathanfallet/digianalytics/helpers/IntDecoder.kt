package me.nathanfallet.digianalytics.helpers

import me.nathanfallet.apirequest.decoder.APIDecoder
import java.lang.NumberFormatException

class IntDecoder: APIDecoder {

    override fun decode(data: ByteArray): Any? {
        val string = data.toString(charset("utf-8")).trim()
        return try {
            string.toInt()
        } catch (e: NumberFormatException) {
            null
        }
    }

}