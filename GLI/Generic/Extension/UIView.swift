//
//  UIView.swift
//  GLI
//
//  Created by Avendi Sianipar on 8/4/20.
//  Copyright © 2020 Avendi Sianipar. All rights reserved.
//

import UIKit

extension UIView {
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func addSubviewWithConstraint(item: UIView, top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, trailing: CGFloat? = nil) {
        item.translatesAutoresizingMaskIntoConstraints = false
        addSubview(item)
        if let top = top {
            item.addTopConstraint(to: self, constant: top)
        }
        if let bottom = bottom {
            item.addBottomConstraint(to: self, constant: bottom * -1)
        }
        if let leading = leading {
            item.addLeadingConstraint(to: self, constant: leading)
        }
        if let trailing = trailing {
            item.addTrailingConstraint(to: self, constant: trailing * -1)
        }
    }
    
    func addSubviewCenterConstraint(item: UIView) {
        item.translatesAutoresizingMaskIntoConstraints = false
        addSubview(item)

        addCenterXConstraint(to: item)
        addCenterYConstraint(to: item)
    }
    
    func addSubviewWithConstraint(item: UIView, spacing: CGFloat) {
        addSubviewWithConstraint(item: item, top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
    }
    
    func addCenterXConstraint(to item: UIView) {
        centerXAnchor.constraint(equalTo: item.centerXAnchor).isActive = true
    }

    func addCenterYConstraint(to item: UIView) {
        centerYAnchor.constraint(equalTo: item.centerYAnchor).isActive = true
    }
    
    func addTopConstraint(to item: UIView, constant: CGFloat) {
        topAnchor.constraint(equalTo: item.topAnchor, constant: constant).isActive = true
    }
    
    func addBottomConstraint(to item: UIView, constant: CGFloat, priority: Float = 1000) {
        let temp = bottomAnchor.constraint(equalTo: item.bottomAnchor, constant: constant)
        temp.priority = UILayoutPriority(rawValue: priority)
        temp.isActive = true
    }
    
    func addLeadingConstraint(to item: UIView, constant: CGFloat, priority: Float = 1000) {
        let temp = leadingAnchor.constraint(equalTo: item.leadingAnchor, constant: constant)
        temp.priority = UILayoutPriority(rawValue: priority)
        temp.isActive = true
    }
    
    func addTrailingConstraint(to item: UIView, constant: CGFloat) {
        trailingAnchor.constraint(equalTo: item.trailingAnchor, constant: constant).isActive = true
    }
    
    func add(child view: UIView, withTag tag: Int = 1) {
        if (viewWithTag(tag) != nil) {
            return
        }
        
        view.tag = tag
        addSubviewWithConstraint(item: view, spacing: 0)
    }
}
