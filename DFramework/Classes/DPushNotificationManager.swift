//
//  DPushNotificationManager.swift
//  DFramework
//
//  Created by Yusuf Demirci on 21.11.20.
//

#if os(iOS)
import UIKit
#endif
import UserNotifications

public extension NSNotification.Name {
    static let didReceiveRemoteNotification =
        Notification.Name(rawValue: "DFramework.didReceiveRemoteNotification")
}

public class DPushNotificationManager {

    // MARK: Properties

    public var didReceiveRemoteNotification: ((_ userInfo: [AnyHashable: Any]) -> Void)?

    private init() {
        didReceiveRemoteNotification = { userInfo in
            DLog.info("Push notification came: \(userInfo)")

            NotificationCenter.default.post(
                name: Notification.Name.didReceiveRemoteNotification,
                object: DPushNotification(userInfo))
        }
    }
}

// MARK: - Publics

public extension DPushNotificationManager {

    #if os(iOS)
    class func register(completion: ((_ isAllowed: Bool) -> Void)? = nil) {
        UNUserNotificationCenter.current().requestAuthorization(
            options: [UNAuthorizationOptions.alert, UNAuthorizationOptions.badge, UNAuthorizationOptions.sound],
            completionHandler: { isSuccess, error in
                if let error = error {
                    DLog.error("Notification registration failed: \(error.localizedDescription)")
                    completion?(false)
                    return
                }

                completion?(isSuccess)
            })

        DispatchQueue.main.async {
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    #endif

    class func authStatus(completion: @escaping(_ status: UNAuthorizationStatus) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            completion(settings.authorizationStatus)
        }
    }

    #if os(iOS)
    class func sendLocalNotification(title: String = "Test title",
                                     body: String = "Test body",
                                     userInfo: [AnyHashable: Any] = [:]) {
        let center = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.userInfo = userInfo
        content.sound = UNNotificationSound.default

        let request = UNNotificationRequest(
            identifier: "UYLLocalNotification",
            content: content,
            trigger: UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false))

        center.add(request, withCompletionHandler: { error in
            if let error = error {
                DLog.debug(error.localizedDescription)
            }
        })
    }
    #endif
}
