//
//  Utility.swift
//  FanTazTech
//
//  Created by Fahid Attique on 15/02/2018.
//  Copyright © 2018 Expertinsol. All rights reserved.
//


import UIKit
//import RNNotificationView

let rootViewController = UIViewController.topViewController()!

class Utility:NSObject {
    

    // MARK:- Validate internet error or not

    
    static func isInternetError( _ error: NSError) -> Bool {
        
        if error.code == -1005 || error.code == -1001 || error.code == -1009 {
            return true
        }
        return false
    }
    
    
    
    // MARK:- Alert Messages
    
    static func showNoNetworkAlert() {
        showCancelTypeAlert(titleNetworkError, message: messageNetworkError, buttonTitle: buttonOK, onController: rootViewController)
    }
    
    static func showAlert(_ error:NSError, onController parentVC: UIViewController = rootViewController) {
        showCancelTypeAlert("", message: error.localizedDescription, buttonTitle: buttonOK, onController: parentVC)
    }
    
    static func showAlert(_ title: String, message: String, onController parentVC: UIViewController = rootViewController) {
        showCancelTypeAlert(title, message: message, buttonTitle: buttonOK, onController: parentVC)
    }
    
    static func showCancelTypeAlert(_ title: String!, message: String!, buttonTitle bTitle: String, onController parentVC: UIViewController!) {
        showCancelTypeAlert(title, message: message, buttonTitle: bTitle, buttonAction: {(alertAction) in}, onController: parentVC)
    }
    
    static func showCancelTypeAlert(_ title: String!, message: String!, buttonTitle bTitle: String, buttonAction bAction: ((UIAlertAction?) -> Void)!, onController parentVC: UIViewController!) {
        _ = showAlert(title, message: message, buttonsDictionary: ["": {($0)}, bTitle: bAction], baseController: parentVC)
    }
    
    // MARK:- Helping Methods
    
    /**
     * shows alert to any controller with
     * title, message and a dictionary for button with value of closures and with button titles in key
     * Cancel button should be on second index
     * 1st Index is for default button
     * from third to onward are destructive buttons with red colours
     * to skip any index use this key/value:  "": {($0)}
     */
    static func showAlert(_ title: String?, message: String?, buttonsDictionary buttons: Dictionary<String, (UIAlertAction?) -> Void>!, baseController parentVC: UIViewController!, preferredStyle: UIAlertController.Style = .alert) -> UIAlertController {
        
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        var count: Int = 0
        for (bTitle, bAction) in buttons {
            if bTitle != "" {
                
                var style: UIAlertAction.Style = UIAlertAction.Style.default
                
                if bTitle == buttonCancel {
                    style = UIAlertAction.Style.cancel
                }

                let alertAction: UIAlertAction = UIAlertAction(title: bTitle, style: style, handler: bAction)
                alertController.addAction(alertAction)
            }
            count += 1
        }
        parentVC.presentViewController(alertController)
        
        return alertController
    }
    
    static func openURL(_ urlString:String) -> Bool {
        
        if urlString.length == 0 {
            QL1("The URL provided is empty.")
            return false
        }
        
        guard let url = URL(string: urlString) else {
            QL1("Could not create the NSURL for" + urlString)
            return false
        }
        
        if !application.canOpenURL(url) {
            QL1("Could not open the NSURL for" + urlString)
            return false
        }
        
        application.openURL(url)
        return true
        
    }
    
    static func convertTimeIntoString(_ hours:Int, minutes:Int, seconds:Int) -> String {
//        let hourString = String(format: "%02d", hours)
        let minuteString = String(format: "%02d", minutes)
        let secondString = String(format: "%02d", seconds)
        
        return "\(minuteString):\(secondString)"
    }
    
    static func convertSecnodsIntoTimeComponents(_ num_seconds: Int) -> (hours: Int, minutes: Int, seconds: Int) {
        
        var num_seconds = num_seconds
        
        let hours: Int = num_seconds / (60 * 60)
        num_seconds -= hours * (60 * 60);
        let minutes = num_seconds / 60
        num_seconds -= minutes * 60
        let seconds = num_seconds
        
        return (hours, minutes, seconds)
    }
    
    static func showNotification(_ title:String, _ message:String){
//        RNNotificationView.sharedNotification.show(withImage: UIImage(named: "Notification_Icon"), title: title, message: message, duration: 5,iconSize: CGSize(width: 45, height: 45), onTap: nil)
    }
    

}

// MARK:- General functions

func isEmpty(_ text:String?) -> Bool
{
    if text == nil {return true}
    if text!.isEmpty == true {return true}
    return false
}

func isEmail(_ text:String?) -> Bool
{
    let EMAIL_REGEX = "^([^@\\s]+)@((?:[-a-z0-9]+\\.)+[a-z]{2,})$"
    let predicate = NSPredicate(format: "SELF MATCHES %@", EMAIL_REGEX)
    return predicate.evaluate(with: text)
}

func className(_ name:AnyClass) -> String {
    return name.self.description().components(separatedBy: ".").last!
}

//====================================================================================================

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
}

struct Version{
    static let SYS_VERSION_FLOAT = (UIDevice.current.systemVersion as NSString).floatValue
    static let iOS7 = (Version.SYS_VERSION_FLOAT < 8.0 && Version.SYS_VERSION_FLOAT >= 7.0)
    static let iOS8 = (Version.SYS_VERSION_FLOAT >= 8.0 && Version.SYS_VERSION_FLOAT < 9.0)
    static let iOS9 = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
}




//func removeSpecialCharsFromString( _ text: String) -> String {
//    let okayChars : Set<Character> =
//        Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890".characters)
//    return String(text.characters.filter {okayChars.contains($0) })
//}
