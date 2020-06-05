//
//  UIView+Constraints.swift
//  Adesys Alarm
//
//  Created by Ishak Guclu on 29/10/2019.
//  Copyright © 2019 Adesys. All rights reserved.
//

import UIKit

extension UIView {
    
    func fillSuperviewWithPadding(padding: UIEdgeInsets = .zero) {
        let newPadding = UIEdgeInsets(top: padding.top, left: padding.left, bottom: padding.bottom, right: padding.right)
        
        // in de anchor methode wordt het al negatief gezet. Superview zou dat niet nodig moeten zijn namelijk
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor, padding: newPadding)
    }
    
    func fillSuperview(padding: Int = 0) {
        let paddingFloat = CGFloat(padding)
        let newPadding = UIEdgeInsets(top: paddingFloat, left: paddingFloat, bottom: paddingFloat, right: paddingFloat)
        
        // in de anchor methode wordt het al negatief gezet. Superview zou dat niet nodig moeten zijn namelijk
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor, padding: newPadding)
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    func anchorSize(width: Int? = nil, height: Int? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        if let width = width {
            widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        }
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                centerXAnch: NSLayoutXAxisAnchor? = nil,
                centerYAnch: NSLayoutYAxisAnchor? = nil,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
        if let centerX = centerXAnch {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerYAnch {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
}
