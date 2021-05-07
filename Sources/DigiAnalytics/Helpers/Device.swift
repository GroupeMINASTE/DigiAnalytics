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

#if canImport(AppKit)
import AppKit
#endif

class Device {
    
    static var name: String {
        #if os(iOS)
        return UIDevice.current.model
        #elseif os(macOS)
        return "Macintosh"
        #endif
    }
    
    static var screenResolution: String {
        #if os(iOS)
        return "\(UIScreen.main.bounds.width)x\(UIScreen.main.bounds.height)"
        #elseif os(macOS)
        return "\(NSScreen.main?.frame.width ?? 0)x\(NSScreen.main?.frame.height ?? 0)"
        #endif
    }
    
}
