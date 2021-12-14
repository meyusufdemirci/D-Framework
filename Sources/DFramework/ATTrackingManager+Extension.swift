//
//  ATTrackingManager+Extension.swift
//  DFramework
//
//  Created by Yusuf Demirci on 1.12.2021.
//

import AppTrackingTransparency

extension ATTrackingManager.AuthorizationStatus {

    var localizedName: String {
        switch self {
        case .notDetermined:
            return "Not determined"
        case .restricted:
            return "Restricted"
        case .denied:
            return "Denied"
        case .authorized:
            return "Authorized"
        @unknown default:
            return "Unknown"
        }
    }
}
