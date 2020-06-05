//
//  UINavigationBar+Additions.swift
//  PharmaApp
//
//  Created by Muhammad Azher on 22/04/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    
//    func setNavigationBarBackgroundImage(with image : UIImage?) {
//        //        tintColor = .white
//        
//        //        if #available(iOS 13.0, *) {
//        //
//        //            prefersLargeTitles = true
//        //
//        //            let largeTitleAppearance = UINavigationBarAppearance()
//        //            largeTitleAppearance.configureWithOpaqueBackground()
//        //            largeTitleAppearance.backgroundImage = image
//        //
//        //            standardAppearance = largeTitleAppearance
//        //            scrollEdgeAppearance = largeTitleAppearance
//        //        }
//        //        else {
//        //            prefersLargeTitles = false
//        //            isOpaque = true
//        //            setBackgroundImage(image, for: .default)
//        //        }
//        
//        //        let gradient = CAGradientLayer()
//        //        var bounds = self.bounds
//        //        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
//        //        gradient.frame = bounds
//        //        gradient.colors = [R.color.pharmaPrimaryBlue()!.cgColor, R.color.pharmaSecondaryBlue()!.cgColor]
//        //        gradient.startPoint = CGPoint(x: 0, y: 0)
//        //        gradient.endPoint = CGPoint(x: 1, y: 0)
//        //
//        //
//        //        if let image = getImageFrom(gradientLayer: gradient) {
//        
//        //    }
//        var flag = false
//        for aView in subviews {
//            
//            if let imageView = aView as? UIImageView {
//                flag = true
//                imageView.image = image
//                break
//            }
//        }
//        
//        if !flag {
//            let imageView = UIImageView.init(image: image)
//            self.addSubview(imageView)
//            imageView.layer.zPosition = -1
//            
//            
//            imageView.frame = CGRect.init(x: 0, y: -44, width: self.frame.width, height: 160)
//        }
//        self.setBackgroundImage(UIImage(), for: .default)
//        self.shadowImage = UIImage()
//        self.isTranslucent = true
//        
//        
////        self.setBackgroundImage(image, for: UIBarMetrics.default)
//        
//        
//    }
    
//    func setImageInCenterOfNavigationBar(with text : String, boldText : String) {
//
//
//        //        self.additionalSafeAreaInsets.top = 20
//
//        //        self.title = title
//
//
//        let colour = UIColor.white
//
//
//
//        //        self.navigationItem.largeTitleDisplayMode = .always
//
//        self.prefersLargeTitles = true
//        self.isHidden = false
//        self.tintColor = UIColor.white
//
//
//        let boldText = boldText
//        let title = text
//        let range = (title as NSString).range(of: boldText)
//
//        let fontSize : CGFloat = UIDevice.isIphone4InchesDevice() ? 20.0 : 25.0
//
//        let attributes: [NSAttributedString.Key : Any] = [.font: R.font.latoMedium(size: fontSize)!, .foregroundColor: colour]
//
//        let attributedString = NSMutableAttributedString(string: title, attributes: attributes)
//
//        attributedString.addAttribute(.font, value: R.font.latoBlack(size: fontSize)!, range: range)
//
//        var flag = false
//        for aView in subviews {
//
//            if let label = aView as? UILabel {
//                flag = true
//                label.attributedText = attributedString
//                break
//            }
//        }
//
//        if !flag {
//
//            let titleLabel = UILabel()
//            titleLabel.attributedText = attributedString
//            titleLabel.frame = CGRect.init(x: 0, y: 50, width: 200, height: 50)
//
//            titleLabel.sizeToFit()
//
//            addSubview(titleLabel)
//            titleLabel.textAlignment = .center
//            titleLabel.frame = CGRect.init(x: 0, y: 50, width: self.frame.width, height: 50)
//        }
//    }
    
//    func getImageFrom(gradientLayer : CAGradientLayer) -> UIImage? {
//
//        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
//        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return image
//    }
    
}
