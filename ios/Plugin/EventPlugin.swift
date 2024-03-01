import Foundation
import Capacitor
import UIKit
import AVKit

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(EventPlugin)
public class EventPlugin: CAPPlugin {
    @State private var timeRemaining = 100
    var timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": value
        ])
    }

    @objc func playVideo(_ call: CAPPluginCall) {
       let value = call.getString("value") ?? ""
        call.resolve([
            "value": value
        ])
    }

    @objc func callback(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": value
        ])
    }

     @objc func register(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": "done"
        ])
    }

    @objc func OnTouchEvent(object: JSObject) {
       notifyListeners("OnTouchEvent", data: makeUrlOpenObject(object), retainUntilConsumed: true)
    }

     @objc func OnClickEvent(object: JSObject) {
       notifyListeners("OnClickEvent", data: makeUrlOpenObject(object), retainUntilConsumed: true)
    }

     @objc func OnTimerCountDown(object: JSObject) {
       notifyListeners("OnTimerCountDown", data: makeUrlOpenObject(object), retainUntilConsumed: true)
    }

     @objc func onUserLogout() {
        JSObject obj = new JSObject();
        obj.put("value", "logout user session");
        notifyListeners("onUserLogout", data: makeUrlOpenObject(obj), retainUntilConsumed: true)
    }

    @objc func SessionTimerStart(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": value
        ])
    }

}
