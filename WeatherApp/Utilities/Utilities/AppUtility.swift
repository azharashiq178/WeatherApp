//
//  AppDataManager.swift
//  FanTazTech
//
//  Created by Fahid Attique on 06/01/2018.
//  Copyright © 2018 Expertinsol. All rights reserved.
//


import UIKit
import AVFoundation
import MobileCoreServices
import MapKit


class AppUtility: NSObject {
    
    
    // MARK:- Shared

    static let sharedInstance = AppUtility()

    
    
    //  MARK:- Class Properties

//    fileprivate lazy var scheduleLocationManager = ScheduledLocationManager()
    

    fileprivate var _appAuthToken:String?
    var appAuthToken:String? {
        get {
            if _appAuthToken == nil { _appAuthToken = userDefaults.object(forKey: keyAuthToken) as? String}
            return _appAuthToken
        }
        
        set {
            if _appAuthToken != newValue {
                _appAuthToken = newValue
                userDefaults.set(_appAuthToken, forKey:keyAuthToken)
                userDefaults.synchronize()
            }
        }
    }
    
    
    fileprivate var _deviceToken:String?
    var deviceToken: String? {
        get {
            if _deviceToken == nil {
                _deviceToken = userDefaults.object(forKey: keydeviceToken) as? String ?? ""
            }
            return _deviceToken
        }
        
        set {
            if deviceToken != newValue {
                _deviceToken = newValue
                userDefaults.set(_deviceToken, forKey:keydeviceToken)
                userDefaults.synchronize()
            }
        }
    }
    

//    fileprivate var _activeUser:User?
//    var activeUser:User? {
//        get {
//            if _activeUser == nil { _activeUser = User.getCurrentUser()}
//            return _activeUser
//        }
//
//        set {
//            if _activeUser != newValue {
//                _activeUser = newValue
//                _ = _activeUser?.saveUser()
//            }
//        }
//    }

    
////    var isIntroViewSeen = userDefaults.bool(forKey: keyIntroViewSeen) {
////        didSet {
////            userDefaults.set(isIntroViewSeen, forKey: keyIntroViewSeen)
////        }
////    }
//
//    fileprivate var isOnRootSteps: Bool {
//        get{
//            let isOnSignUpVC = UIViewController.topViewController() is SignUpVC
//            let isOnLoginVC  = UIViewController.topViewController() is LoginVC
//            let isOnSignupSuccessVC  = UIViewController.topViewController() is SignUpSuccessVC
//            return isOnLoginVC || isOnSignUpVC || isOnSignupSuccessVC
//        }
//    }
//    
//    
//    
//    
//    // MARK:- Functions
//    
//    func showLoginSignUpView() {
//
//        if isOnRootSteps { return }
//        guard let topVC = UIViewController.topViewController() else { return }
//        guard let panel = topVC as? FAPanelController else {
//            
//            let panelVC = FAPanelController()
//            panelVC.configs.centerPanelTransitionType = .crossDissolve
//            let loginVC = UIStoryboard.main.instantiateInitialViewController()!
//            
//            UIView.transition(from: topVC.view, to: loginVC.view, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve) { (finished) in
//                _ = panelVC.center(loginVC)
//                application.keyWindow?.rootViewController = panelVC
//            }
//
//            return
//        }
//        _ = panel.center(UIStoryboard.main.instantiateInitialViewController()!)
//    }
//    




//    func logoutAppUser() {
//
//        User.logoutUser()
//
//        if let panel = application.keyWindow?.rootViewController as? FAPanelController {
//
//            _ = panel.center(UIStoryboard.main.instantiateInitialViewController()!, afterThat: {
//                _ = panel.left(nil)
//            })
//            return
//        }
//
//        if let topVC = UIViewController.topViewController() {   //  It can be any VC : UIAlertController as well : It won't work incase of Alert Controller.
//
//            if let panel = topVC.panel {
//                _ = panel.center(UIStoryboard.main.instantiateInitialViewController()!, afterThat: {
//                    _ = panel.left(nil)
//                })
//                return
//            }
//        }
//
//        QL1("Unable to find FAPanelController -- Unable to Logout user")
//    }

    
    

    

//    func handleTokenExpiry(_ errorMessage: String) {
//
//        let topViewController = UIViewController.topViewController()!
//        topViewController.view?.hidHud()
//
//        let _ = Utility.showAlert("", message: errorMessage, buttonsDictionary: [buttonOK: {(alertAction) in
//
//            if let _ = self.activeUser {
//                appUtility.logoutAppUser()
//            }
//
//            }], baseController: topViewController)
//    }

    
    
    
    
    
//    func showDirectionsInMaps(with latitude : String, longitude: String, address: String) {
//
//
//        _ = Utility.showAlert("", message: "Please Choose the Category", buttonsDictionary: ["Google Maps": {(alertAction) in
//
//                openInGoogleMaps()
//
//            },"Waze": {(alertAction) in
//
//                openInWazeMaps()
//
//            },"2Gis": {(alertAction) in
//
//                openIn2gisMaps()
//
//            },"Apple Maps": {(alertAction) in
//
//                openInAppleMaps()
//
//            }, buttonCancel: {(alertAction) in }], baseController: UIViewController.topViewController()!, preferredStyle: .actionSheet)
//
//
//        func openInAppleMaps() {
//
//            let lat = (latitude as NSString).floatValue
//            let long = (longitude as NSString).floatValue
//            let regionDistance:CLLocationDistance = 10000
//            let coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(lat),CLLocationDegrees(long))
//            let regionSpan = MKCoordinateRegionMakeWithDistance(coordinate, regionDistance, regionDistance)
//            let options = [
//                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
//                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
//            ]
//            let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
//            let mapItem = MKMapItem(placemark: placemark)
//            mapItem.name = address
//            mapItem.openInMaps(launchOptions: options)
//        }
//
//
//        func openIn2gisMaps() {
//
//            let baseURL2gis = "https://2gis.ae/dubai/search/"
//            let urlAsString = baseURL2gis + address
//
//            let urlEncodedString = urlAsString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
//
//            if let urlToSearch = URL(string: urlEncodedString){
//                UIApplication.shared.open(urlToSearch, options: [:], completionHandler: nil)
//            }
//        }
//
//
//        func openInGoogleMaps() {
//
//            if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
//
//                UIApplication.shared.open(URL(string:"comgooglemaps://?center=\("1"),\("\(longitude)")&zoom=14&views=traffic&q=\("\(latitude)"),\("\(longitude)")")!, options: [:], completionHandler: nil)
//
//            } else {
//
//                UIApplication.shared.open(URL(string: "https://maps.google.com/?q=@\(latitude),\(longitude)")!, options: [:], completionHandler: nil)
//            }
//        }
//
//
//        func openInWazeMaps() {
//
//            if (UIApplication.shared.canOpenURL(URL(string:"waze://")!)) {
//
//                UIApplication.shared.open(URL(string:"https://waze.com/ul?ll=\(latitude),\(longitude)&navigate=yes")!, options: [:], completionHandler: nil)
//
//            } else {
//
//                UIApplication.shared.open(URL(string: "https://waze.com/ul?ll=\(latitude),\(longitude)&navigate=yes")!, options: [:], completionHandler: nil)
//            }
//        }
//    }
    
    
    
    
    
    
    
////
////    func handleUserBlockedError(_ errorMessage: String) {
////
////        let topViewController = UIViewController.topViewController()!
////
////        let alertViewTag = 2002
////
////        if topViewController is UIAlertController && topViewController.view.tag == alertViewTag {
////            //Token Error Alert is already displayed. So, no need to display it again.
////            return
////        }
////
////        _ = ProgressHud.hideHUDForView(topViewController.view)
////        let alertViewController = Utility.showAlert(errorMessage, message: "", buttonsDictionary: [buttonOK: {(alertAction) in
////            appUtility.logoutAppUser()
////            }], baseController: topViewController)
////
////        alertViewController.view.tag = alertViewTag
////    }
//
//
////    func handleForceUpdate(_ message: String) {
////
////        let topViewController = UIViewController.topViewController()!
////
////        let alertViewTag = 2004
////
////        if topViewController is UIAlertController && topViewController.view.tag == alertViewTag {
////            //Token Error Alert is already displayed. So, no need to display it agai.
////            return
////        }
////
////        _ = ProgressHud.hideHUDForView(topViewController.view)
////
////        let alertViewController = Utility.showAlert("Get our latest app", message: message, buttonsDictionary: [buttonGoToAppstore: {(alertAction) in
////
////            if let url = URL(string: appstoreURL),
////                UIApplication.shared.canOpenURL(url){
////                UIApplication.shared.openURL(url)
////            }
////
////            }], baseController: topViewController)
////
////        alertViewController.view.tag = alertViewTag
////    }
//
//    
//    //  MARK: - Utility Functions
//    
//    
//    func callNumber( _ phoneNumber:String) {
//        
//        if let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
//            if #available(iOS 10, *) {
//                UIApplication.shared.open(url)
//            } else {
//                UIApplication.shared.openURL(url)
//            }
//        }
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    // MARK:- Thumbnail Generation
//
//    
//    func getThumbnailFrom(path: URL) -> UIImage? {
//        
//        do {
//            
//            let asset = AVURLAsset(url: path , options: nil)
//            let imgGenerator = AVAssetImageGenerator(asset: asset)
//            imgGenerator.appliesPreferredTrackTransform = true
//            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
//            let thumbnail = UIImage(cgImage: cgImage)
//            
//            return thumbnail
//            
//        } catch let error {
//            
//            print("*** Error generating thumbnail: \(error.localizedDescription)")
//            return nil
//            
//        }
//    }
//
//    
//
//    
//    func requestAsset(for capturedImage: UIImage, completion completionBlock:@escaping (_ asset: PHAsset)-> Void) {
//        
//        var placeholder: PHObjectPlaceholder?
//        PHPhotoLibrary.shared().performChanges({
//            let request = PHAssetChangeRequest.creationRequestForAsset(from: capturedImage)
//            placeholder = request.placeholderForCreatedAsset
//        }, completionHandler: { success, error in
//            guard let placeholder = placeholder, let asset = PHAsset.fetchAssets(withLocalIdentifiers: [placeholder.localIdentifier], options: nil).firstObject, success == true else {
//                return
//            }
//
//            completionBlock(asset)
//        })
//    }
//    
//    func saveVideo(fromUrl outputFileURL: URL, completion completionBlock:@escaping (_ asset: AVURLAsset?)-> Void) {
//        
//        PHPhotoLibrary.shared().performChanges({
//            PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: outputFileURL)
//        }) { saved, error in
//            if saved {
//
//                completionBlock(nil)
//
//                
////                let fetchOptions = PHFetchOptions()
////                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
////
////
////                // After uploading we fetch the PHAsset for most recent video and then get its current location url
////
////                let fetchResult = PHAsset.fetchAssets(with: .video, options: fetchOptions).lastObject
////                PHImageManager().requestAVAsset(forVideo: fetchResult!, options: nil, resultHandler: { (avurlAsset, audioMix, dict) in
////                    let newObj = avurlAsset as! AVURLAsset
////                    print(newObj.url)
////                    // This is the URL we need now to access the video from gallery directly.
////                })
//            }
//        }
//    }
//    
//
//    
//    //  Mime Type
//    
//    func mimeType(of fileUrl: URL) -> String {
//        let pathExtension = fileUrl.pathExtension
//        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension as NSString, nil)?.takeRetainedValue() {
//            if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
//                return mimetype as String
//            }
//        }
//        return "application/octet-stream"
//    }
//
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    //  Password Regex
//    
//    func isValidPassword(_ pass: String?) -> Bool {
//        
//        let passwordRegex = "^(?=.*[A-Z])(?=.*[$@$#!%*?&])(?=.*[0123456789])[A-Za-z\\d$@$#!%*?&]{8,}"
//        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: pass)
//    }
}













//extension AppUtility {
//
//
//    func imageFrom(asset:PHAsset, size:CGSize, success:@escaping (_ photo:UIImage)->Void){
//
//        let options = PHImageRequestOptions()
//        options.isSynchronous = false
//        options.deliveryMode = .highQualityFormat
//        PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: options, resultHandler: { (image, attributes) in
//            let photo = image ?? #imageLiteral(resourceName: "coach")
//            success(photo)
//        })
//    }
//}













//extension AppUtility {
//
//    func startTrackingDriversLocation() {
//        
//        scheduleLocationManager.getUserLocationWithInterval(interval: 3)
//        scheduleLocationManager.delegate = self
//    }
//}







//extension AppUtility: ScheduledLocationManagerDelegate {
//
//    func scheduledLocationManage(_ manager: ScheduledLocationManager, didUpdateLocation newLocation: CLLocation) {
//
//    }
//
//
//    func scheduledLocationManage(_ manager: ScheduledLocationManager, didFailWithError error: Error) {
//
//        QL1(error.localizedDescription)
//    }
//}

