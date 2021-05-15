/*
*  Copyright (C) 2021 Groupe MINASTE
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with this program; if not, write to the Free Software Foundation, Inc.,
* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*
*/

import Foundation
import APIRequest

public class DigiAnalytics {
    
    // MARK: - Properties
    
    /// Configuration to fetch API
    private let apiConfiguration = APIConfiguration(
        host: "digianalytics.fr",
        scheme: "https",
        port: 443,
        headers: {
            return [
                "User-Agent": Device.userAgent
            ]
        }
    )
    
    /// Base URL for DigiAnalytics website (ending by a /)
    private var baseURL: String
    
    /// Last sent page (for reffer)
    private var lastRequest: String?
    
    // MARK: - Initializer
    
    public init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    // MARK: - Methods
    
    /// Send a request to API
    public func send(path: String, completionHandler: ((APIResponseStatus) -> Void)? = nil) {
        // Send the request
        APIRequest("POST", path: "/api/event", configuration: apiConfiguration)
            .with(body: [
                "page": baseURL + path,
                "screen_resolution": Device.screenResolution,
                "event": nil,
                "referrer": lastRequest
            ])
            .execute(Int.self) { data, status in
                // Complete the request
                if let data = data {
                    if data == status.rawValue {
                        completionHandler?(status)
                    } else {
                        completionHandler?(APIResponseStatus.status(forCode: data))
                    }
                } else {
                    completionHandler?(status)
                }
            }
        
        // Save this request
        lastRequest = baseURL + path
    }
    
}
