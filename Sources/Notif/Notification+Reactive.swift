//
//  Notification+Reactive.swift
//  
//
//  Created by iWw on 2020/12/17.
//

//#if canImport(ReactiveCocoa) && canImport(ReactiveSwift)
//import UIKit
//import ReactiveCocoaObjc
//import ReactiveCocoa
//import ReactiveSwift
//
//// MARK:- extension Notif
//
//public extension Notif {
//    /// 监听, 绑定生命周期
//    /// - Parameters:
//    ///   - obj: 生命周期绑定
//    ///   - object: object description
//    /// - Returns: signal
//    func listen(duringOf obj: AnyObject, object: Any? = nil) -> Signal<Notification, Never> {
//        observer(object).take(duringLifetimeOf: obj)
//    }
//
//    /// 监听, 可自定义生命周期; 如需要绑定生命周期用 listen(duringOf:,object:)
//    /// - Parameter object: object description
//    /// - Returns: signal，可自定义生命周期, 选择 take 或者 duringOfObject
//    func observer(_ object: Any? = nil) -> Signal<Notification, Never> {
//        nc.r.notif(self, object: object)
//    }
//}
//
//public extension Reactive where Base: NotificationCenter {
//
//    func notif(_ notif: Notif, object: Any? = nil) -> Signal<Notification, Never> {
//        return Signal { [base = self.base] observer, lifetime in
//            let notificationObserver = base.addObserver(forName: notif.name, object: object, queue: nil) { notification in
//                observer.send(value: notification)
//            }
//
//            lifetime.observeEnded {
//                base.removeObserver(notificationObserver)
//            }
//        }
//    }
//}
//
//// MARK:- extension Notification.Name
//
//public extension Notification.Name {
//
//    func listen(duringOf obj: AnyObject, object: Any? = nil) -> Signal<Notification, Never> {
//        observer(object).take(duringLifetimeOf: obj)
//    }
//    func observer(_ object: Any? = nil) -> Signal<Notification, Never> {
//        NotificationCenter.default.r.notifications(forName: self)
//    }
//}
//
//public extension Signal where Value == Notification, Error == Never {
//
//    @discardableResult
//    func observeObject(_ object: @escaping (Any?) -> Void) -> Disposable? {
//        observeValues { (notify) in
//            object(notify.object)
//        }
//    }
//    @discardableResult
//    func observeUserInfo(_ userInfo: @escaping (AnyDict?) -> Void) -> Disposable? {
//        observeValues { (notify) in
//            userInfo(notify.userInfo)
//        }
//    }
//
//}
//
//#endif
