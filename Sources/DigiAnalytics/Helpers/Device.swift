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

#if canImport(UIKit)
import UIKit
#endif

#if canImport(WatchKit)
import WatchKit
#endif

#if canImport(AppKit)
import AppKit
#endif

class Device {
    
    // MARK: - User Agent
    
    static var userAgent: String {
        return "Mozilla/5.0 (\(name); \(cpuAndOS) \(osVersion)) Version/14.1 Safari/605.1.15"
    }
    
    // MARK: - Device type
    
    static var name: String {
        #if os(iOS)
        return UIDevice.current.model
        #elseif os(watchOS)
        return WKInterfaceDevice.current().model
        #elseif os(macOS)
        return "Macintosh"
        #endif
    }
    
    static var cpuAndOS: String {
        #if os(iOS)
        return "CPU iPhone OS"
        #elseif os(watchOS)
        return "CPU Apple WatchOS"
        #elseif os(macOS)
        return "Intel Mac OS X"
        #endif
    }
    
    // MARK: - OS version
    
    static var osVersion: String {
        #if os(iOS)
        return UIDevice.current.systemVersion.replacingOccurrences(of: ".", with: "_")
        #elseif os(watchOS)
        return WKInterfaceDevice.current().systemVersion.replacingOccurrences(of: ".", with: "_")
        #elseif os(macOS)
        let version = ProcessInfo.processInfo.operatingSystemVersion
        return "\(version.majorVersion)_\(version.minorVersion)_\(version.patchVersion)"
        #endif
    }
    
    // MARK: - Screen resolution
    
    static var screenWidth: Int {
        #if os(iOS)
        return Int(UIScreen.main.bounds.width)
        #elseif os(watchOS)
        return Int(WKInterfaceDevice.current().screenBounds.width)
        #elseif os(macOS)
        return Int(NSScreen.main?.frame.width ?? 0)
        #endif
    }
    
    static var screenHeight: Int {
        #if os(iOS)
        return Int(UIScreen.main.bounds.height)
        #elseif os(watchOS)
        return Int(WKInterfaceDevice.current().screenBounds.height)
        #elseif os(macOS)
        return Int(NSScreen.main?.frame.height ?? 0)
        #endif
    }
    
    static var screenResolution: String {
        return "\(screenWidth)x\(screenHeight)"
    }
    
}
