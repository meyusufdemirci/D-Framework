//
//  UIDevice+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

#if os(iOS)
import UIKit
#else
import Foundation
#endif

#if os(iOS)
public extension UIDevice {

    var deviceModelCode: String? {
        if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
            return simulatorModelIdentifier
        }

        var systemInfo = utsname()
        uname(&systemInfo)

        return String(
            bytes: Data(bytes: &systemInfo.machine,
                        count: Int(_SYS_NAMELEN)),
            encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
    }
}
#endif
