//
//  UIViewExtension.swift
//  OldAppStore
//
//  Created by Руслан Акберов on 11.05.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

extension UIView {
    
    func addconstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}
