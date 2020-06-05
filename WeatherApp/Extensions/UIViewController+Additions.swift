//
//  UIViewController+Additions.swift
//  LanguageParrot
//
//  Created by Muhammad Azher on 01/08/2016.
//  Copyright © 2017 Muhammad Azher. All rights reserved.
//

import UIKit


enum ControllerLoadType {
    case push, present
}

extension UIViewController {
    
    
    
    // MARK:- Load/Instantiate

    static func instantiate(from storyboard: UIStoryboard) -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }

    
    
    
    
    // MARK:- Keyboard Editing

    func endEditing() {
        view.endEditing(true)
    }
    
    
    @objc func changeDate(with updateDate : Date) {
        
    }
    
    
    @objc func refreshData() {
        
    }
    
    // MARK:- Presentation/Dismiss
    
    class func topViewController(_ base: UIViewController? = UIApplication.shared.windows.first!.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
    
    fileprivate func dismissPresentedController() {
        self.dismiss(animated: true, completion: { () -> Void in
            QL2("\(String(describing: type(of: self))) is dismiss.")
        })
    }
    
    fileprivate func dismissPushedController() {
        _ = self.navigationController?.popViewController(animated: true)
    }

    func presentViewController(_ viewControllerToPresent: UIViewController) {
        self.presentViewController(viewControllerToPresent, animated: true)
    }
    
    func presentViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
        self.present(viewControllerToPresent, animated: flag) { () -> Void in
            QL2("\(String(describing: type(of: viewControllerToPresent))) is presented.")
        }
    }
    
    func dismissViewController(_ completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
    
    @objc func dismissMe() {
        if let navigationViewController = self.navigationController {
            
            if (navigationViewController.viewControllers.count > 1) {
                dismissPushedController()
            } else {
                dismissPresentedController()
            }
            
        } else {
            dismissPresentedController()
        }
    }

    @IBAction func dismiss(_ sender: UIButton) {
        endEditing()
        dismissMe()
    }

    func addCancelButton() {
        
        let cancelButton = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(dismissMe))
        navigationItem.leftBarButtonItem = cancelButton
    }

    
    
    
    // MARK:- NAvigation Fade Affect
    
    func fadeHideNavigation() {
        fadeNavigationBar(withAplha: 0.0)
    }

    func fadeUnHideNavigation() {
        fadeNavigationBar(withAplha: 1.0)
    }

    fileprivate func fadeNavigationBar(withAplha alpha: CGFloat) {
        
        guard let navigationBar = navigationController?.navigationBar else { return }
        if navigationBar.alpha == alpha { return }
        
        UIView.animate(withDuration: 0.25) { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.navigationController?.navigationBar.alpha = alpha
        }
    }
    
    
    
//    func setNavigationBarGradient(title: String) {
//        //        self.additionalSafeAreaInsets.top = 20
//
//        //        self.title = title
//
//        let titleLabel = UILabel()
//        let colour = UIColor.red
//
//
//        let boldText = "My"
//        let title = "My String"
//        let range = (title as NSString).range(of: boldText)
//
//        let attributes: [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 30), .foregroundColor: colour, .kern : 5.0]
//
//        let attributedString = NSMutableAttributedString(string: title, attributes: attributes)
//
//        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 50), range: range)
//
//        titleLabel.attributedText = attributedString
//        titleLabel.frame = CGRect.init(x: 0, y: 50, width: 200, height: 50)
//
//        titleLabel.sizeToFit()
//
//        self.navigationItem.largeTitleDisplayMode = .always
//
//
//        if let navigationBar = self.navigationController?.navigationBar {
//            navigationBar.prefersLargeTitles = true
//            navigationBar.isHidden = false
//            navigationBar.tintColor = UIColor.white
//            navigationBar.addSubview(titleLabel)
//            let gradient = CAGradientLayer()
//            var bounds = navigationBar.bounds
//            bounds.size.height += UIApplication.shared.statusBarFrame.size.height
//            gradient.frame = bounds
//            gradient.colors = [R.color.pharmaPrimaryBlue()!.cgColor, R.color.pharmaSecondaryBlue()!.cgColor]
//            gradient.startPoint = CGPoint(x: 0, y: 0)
//            gradient.endPoint = CGPoint(x: 1, y: 0)
//
//
//            if let image = getImageFrom(gradientLayer: gradient) {
//                let imageView = UIImageView.init(image: image)
//                self.navigationController?.navigationBar.insertSubview(imageView, at: 1)
//
//
//                imageView.frame = CGRect.init(x: 0, y: -20, width: self.navigationController!.navigationBar.frame.width, height: 170)
//                self.navigationController?.navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
//            }
//
//
//        }
//    }
    
    
    func getImageFrom(gradientLayer : CAGradientLayer) -> UIImage? {
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
//    func assetToImageWith(asset: PHAsset) -> UIImage {
//        let manager = PHImageManager.default()
//        let option = PHImageRequestOptions()
//        var thumbnail = UIImage()
//        option.isSynchronous = true
//        manager.requestImage(for: asset, targetSize: CGSize(width: CGFloat.infinity, height: CGFloat.infinity), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
//            thumbnail = result!
//        })
//        return thumbnail
//    }
//    // MARK:- TextField Validations
//    func validateTextField(with textField: UITextField) -> (Bool,String?) {
//        if textField.text?.count == 0 {
//            return (false,"Please enter \(textField.placeholder!)")
//        }
//        else {
//            return (true,nil)
//        }
//    }
    
}





extension UIApplication {
    class var statusBarBackgroundColor: UIColor? {
        get {
            return (shared.value(forKey: "statusBar") as? UIView)?.backgroundColor
        } set {
            (shared.value(forKey: "statusBar") as? UIView)?.backgroundColor = newValue
        }
    }
}
