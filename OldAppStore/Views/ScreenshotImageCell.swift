//
//  ScreenshotImageCell.swift
//  OldAppStore
//
//  Created by Руслан Акберов on 13.05.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class ScreenshotImageCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .green
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.masksToBounds = true
        return iv
    }()

    override func setupViews() {
        super.setupViews()
        addSubview(imageView)
        addconstraintsWithFormat("H:|[v0]|", views: imageView)
        addconstraintsWithFormat("V:|[v0]|", views: imageView)
    }
    
    
}
