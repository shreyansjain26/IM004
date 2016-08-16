//
//  ViewController.swift
//  IM-004
//
//  Created by Shreyans Jain on 11/08/16.
//  Copyright © 2016 sj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inText: UITextField!
    @IBOutlet weak var notificationButton: UIButton!
    
    private var foregroundNotification: NSObjectProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(!UIApplicationLaunchOptionsLocalNotificationKey.isEmpty ) {
            let ac = UIAlertController(title: "Alert", message:inText.text, preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getNotification(sender: AnyObject) {
    
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 6)
        notification.alertBody = inText.text
        notification.alertAction = "Notification"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["CustomField1": "w00t"]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    
    }

}

