//
//  AppDetailDescriptionCell.swift
//  OldAppStore
//
//  Created by Руслан Акберов on 13.05.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class AppDetailDescriptionCell: BaseCell {
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Sample text"
        tv.isEditable = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func setupViews() {
        super.setupViews()
        addSubview(textView)
        addSubview(dividerLine)
        addconstraintsWithFormat("H:|-8-[v0]-8-|", views: textView)
        addconstraintsWithFormat("H:|-14-[v0]|", views: dividerLine)
        addconstraintsWithFormat("V:|-4-[v0]-4-[v1(0.5)]|", views: textView, dividerLine)
    }
    
}



