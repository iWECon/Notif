//
//  Notifiable.swift
//  
//
//  Created by iWw on 2021/1/17.
//

import UIKit

/*
 class User: NSObject {
    @Notifiable("User.Token.DidChange") var token = ""
 
    // initial: true, when the user created, send notify
    @Notifiable("User.Sex.DidChange", initial: true) var sex = 0
 }
 
 NotificationCenter.default.addObserver(forName: NSNotification.Name("User.Token.DidChange"), object: nil, queue: .main) { (notification) in
    if let userInfo = notification.userInfo {
        let oldValue = userInfo["old"] // ""
        let newValue = userInfo["new"] // "newToken"
        let isInitial = userInfo["isInitial"] as! Bool // "false"
    }
    if let object = notification.object {
        // object "newToken"
    }
 }
 
 let user = User()       // send notify: User.Sex.DidChange = 0
 user.token = "newToken" // send notify: User.Token.DidChange = "newToken"
 user.sex = 1            // send notify: User.Sex.DidChange = 1
 */

@propertyWrapper
public struct Notifiable<Value> {
    
    let notificationNames: [Notification.Name]
    var value: Value
    
    public var wrappedValue: Value {
        get { value }
        set {
            let oldValue = value
            value = newValue
            notify(oldValue: oldValue, newValue: newValue)
        }
    }
    
    //var projectedValue: Notifiable<Value> { self }
    
    
    /// Initialize
    /// - Parameters:
    ///   - wrappedValue: self
    ///   - notificationNames: name string of Notification
    ///   - initial: notify when initial if true, default is false
    public init(wrappedValue: Value, _ notificationNames: String..., initial: Bool = false) {
        self.value = wrappedValue
        self.notificationNames = notificationNames.map({ Notification.Name($0) })
        if initial {
            self.notify(oldValue: value, newValue: value, initial: true)
        }
    }
    
    /// Initialize
    /// - Parameters:
    ///   - wrappedValue: self
    ///   - notificationNames: name of Notification.Name
    ///   - initial: notify when initial if true, default is false
    public init(wrappedValue: Value, _ notificationNames: Notification.Name..., initial: Bool = false) {
        self.value = wrappedValue
        self.notificationNames = notificationNames
        if initial {
            self.notify(oldValue: value, newValue: value, initial: true)
        }
    }
    
    public init(wrappedValue: Value, _ notificationNames: Notif..., initial: Bool = false) {
        self.value = wrappedValue
        self.notificationNames = notificationNames.map({ $0.name })
        if initial {
            self.notify(oldValue: value, newValue: value, initial: true)
        }
    }
    
    func notify(oldValue: Value, newValue: Value, initial: Bool = false) {
        // send notification
        for name in notificationNames {
            NotificationCenter.default.post(name: name, object: value, userInfo: ["old": oldValue, "new": newValue, "isInitial": initial])
        }
    }
}
