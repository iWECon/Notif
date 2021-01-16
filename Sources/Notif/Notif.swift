//
//  Notif.swift
//
//
//  Created by iWw on 2020/12/17.
//

import UIKit

public struct Notif: RawRepresentable {
    public typealias RawValue = String
    public var rawValue: String
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    private var nc = NotificationCenter.default
}

public extension Notif {
    
    var name: Notification.Name {
        return Notification.Name(self.rawValue)
    }
    
    func add(observer: Any, selector: Selector, object: Any? = nil) {
        nc.addObserver(observer, selector: selector, name: self.name, object: object)
    }
    func remove(observer: Any, object: Any? = nil) {
        nc.removeObserver(observer, name: self.name, object: object)
    }
    
    func post(userInfo: [AnyHashable: Any]? = nil, object: Any? = nil) {
        nc.post(name: self.name, object: object, userInfo: userInfo)
    }
    func post(notification: Notification) {
        post(userInfo: notification.userInfo, object: notification.object)
    }
}

public extension Notification.Name {
    
    func add(observer: Any, selector: Selector, object: Any? = nil) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: self, object: object)
    }
    
    func post(userInfo: [AnyHashable: Any]? = nil, object: Any? = nil) {
        NotificationCenter.default.post(name: self, object: object, userInfo: userInfo)
    }
    func post(notification: Notification) {
        post(userInfo: notification.userInfo, object: notification.object)
    }
    
}
