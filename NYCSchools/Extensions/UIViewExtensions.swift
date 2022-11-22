//
//  UIViewExtensions.swift
//  NYCSchools
//
//  Created by Subbareddy l on 11/20/22.
//

import UIKit

extension UIView {
    func constraintsToFillSuperView() -> [NSLayoutConstraint] {
        guard let superView = superview else {
            return [NSLayoutConstraint]()
        }
        return [superView.leftAnchor.constraint(equalTo: leftAnchor),
                superView.rightAnchor.constraint(equalTo: rightAnchor),
                superView.topAnchor.constraint(equalTo: topAnchor),
                superView.bottomAnchor.constraint(equalTo: bottomAnchor)]
    }
    
    func findViewWithAccessibilityIdentifier(identifier: String) -> UIView? {
        if accessibilityIdentifier == identifier {return self}
        for view in subviews {
            if let view = view.findViewWithAccessibilityIdentifier(identifier: identifier) {
                return view
            }
        }
        return nil
    }
}
