//
//  LocalNotificationsView.swift
//  SwiftConcepts
//
//  Created by Nathan Leach on 10/3/23.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    
    static let instance = NotificationManager() //Singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Here is a notification"
        content.subtitle = "And its contents"
        content.sound = .default
        content.badge = 1 //can be based off things like incoming message count, or amount of backed up notifications
        
        //3 triggers
        ///time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
        
        ///calendar
        ///scheduled for 4:19 pm does not repeat
        var dateComponents = DateComponents()
        dateComponents.hour = 16
        dateComponents.minute = 19
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        ///location
//        let trigger = UNLocationNotificationTrigger(coder:...)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
        
    }
}

struct LocalNotificationsView: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Request Permission") {
                NotificationManager.instance.requestAuthorization()
            }
            .buttonStyle(.borderedProminent)
            Button("Schedule Notification") {
                NotificationManager.instance.scheduleNotification()
            }
            .buttonStyle(.borderedProminent)
        }
        .onAppear() {
            UNUserNotificationCenter.current().setBadgeCount(0)
        }
    }
}

#Preview {
    LocalNotificationsView()
}
