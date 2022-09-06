//
//  Reminder.swift
//  takemeds
//
//  Created by Ekaterina Bulavina on 26.08.2022.
//

import UserNotifications
import UserNotificationsUI

protocol ReminderProtocol {
    func createRemind(med: MedsItemModel)
}

final class Reminder: ReminderProtocol {
    func createRemind(med: MedsItemModel) {
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .sound, .badge], completionHandler: { _, _ in }
        )
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.hour = calendar.component(.hour, from: med.reminderTime)
        dateComponents.minute = calendar.component(.minute, from: med.reminderTime)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let content = UNMutableNotificationContent()
        
        content.title = "You must take your meds!"
        content.body = "Your med: \(med.name)"
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(
            identifier: med.id, content: content, trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
