//
//  NotificationCenterViewController.swift
//  Movist
//
//  Created by Yildiz, Koray(AWF) on 18.07.2020.
//  Copyright © 2020 Koray Yildiz. All rights reserved.
//

import UIKit

public final class NotificationCenterViewController: UIViewController, ViewController {
    
    public static var storyboardName: UIStoryboard.Name = .notificationCenter
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var display: NotificationsDisplay = .empty {
        didSet {
            tableView.reloadData()
        }
    }
    
    public var dummyNotifications: [NotificationDisplay] = [
        NotificationDisplay(icon: .randomIcon(), message: "Some Text", date: Date(), isRead: false),
        NotificationDisplay(icon: .randomIcon(), message: "Some Text", date: Date(), isRead: false),
        NotificationDisplay(icon: .randomIcon(), message: "Some Text", date: Date(), isRead: false),
        NotificationDisplay(icon: .randomIcon(), message: "Some Text", date: Date(), isRead: false),
        NotificationDisplay(icon: .randomIcon(), message: "Some Text", date: Date(), isRead: false),
        NotificationDisplay(icon: .randomIcon(), message: "Some Text", date: Date(), isRead: false),
        NotificationDisplay(icon: .randomIcon(), message: "Some Text", date: Date(), isRead: false),
        NotificationDisplay(icon: .randomIcon(), message: "Some Text", date: Date(), isRead: false)
    ]
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(red: 47, green: 47, blue: 59) // TODO: - Move AppColor
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        display = .init(notifications: dummyNotifications)
    }
}

extension NotificationCenterViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return display.notifications.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = display.notifications[indexPath.item].message
        return cell
    }
}

public struct NotificationsDisplay {
    
    let notifications: [NotificationDisplay]
    
    public static let empty = NotificationsDisplay(notifications: .empty())
}

public struct NotificationDisplay {
    
    let icon: URL?
    let message: String
    let date: Date
    let isRead: Bool
    
    public init(icon: URL?, message: String, date: Date, isRead: Bool) {
        self.icon = icon
        self.message = message
        self.date = date
        self.isRead = isRead
    }
    
    private init() {
        icon = .localhost
        message = .empty
        date = Date()
        isRead = false
    }
    
    public static let empty = NotificationDisplay()
}
