//
//  NotificationController.swift
//  Collab
//
//  Created by Kevin Chung on 2/24/18.
//  Copyright © 2018 FPAApps. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationController: UIViewController {

    @IBAction func getNotified(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "This is a notification title"
        content.subtitle = "And this is the subtitle"
        content.body = "Don't forget about the body!"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let request = UNNotificationRequest(identifier: "randomNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
