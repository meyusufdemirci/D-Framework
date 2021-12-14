//
//  DPushNotification.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

import Foundation

public class DPushNotification {

    // MARK: Properties

    public var alert: String?
    public var sound: String?

    public init(_ userInfo: [AnyHashable: Any]) {
        if let apsJSON = userInfo["aps"] as? [String: Any] {
            alert = apsJSON["alert"] as? String
            sound = apsJSON["sound"] as? String
        }
    }
}
