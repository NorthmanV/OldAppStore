//
//  AppDetailHeader.swift
//  OldAppStore
//
//  Created by Руслан Акберов on 09.05.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class AppDetailHeader: BaseCell {
    
    var app: App? {
        didSet {
            if let imageName = app?.imageName {
                imageView.image = UIImage(named: imageName)
            }
            nameLabel.text = app?.name
            if  let price = app?.price {
                buyButton.setTitle("$\(price)", for: .normal)
            }
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Details", "Reviews", "Related"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = .gray
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("BUY", for: .normal)
        button.layer.borderColor = UIColor(red: 0, green: 129/255, blue: 250/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        imageView.backgroundColor = .yellow
        addSubview(imageView)
        addSubview(segmentedControl)
        addSubview(nameLabel)
        addSubview(buyButton)
        addSubview(dividerLine)
        addconstraintsWithFormat("H:|-14-[v0(100)]-8-[v1]-8-|", views: imageView, nameLabel)
        addconstraintsWithFormat("V:|-14-[v0(100)]", views: imageView)
        addconstraintsWithFormat("V:|-14-[v0(20)]", views: nameLabel)
        
        addconstraintsWithFormat("H:|-40-[v0]-40-|", views: segmentedControl)
        addconstraintsWithFormat("V:[v0(34)]-8-|", views: segmentedControl)

        addconstraintsWithFormat("H:[v0(60)]-14-|", views: buyButton)
        addconstraintsWithFormat("V:[v0(32)]-56-|", views: buyButton)
        
        addconstraintsWithFormat("H:|[v0]|", views: dividerLine)
        addconstraintsWithFormat("V:[v0(0.5)]|", views: dividerLine)

    }
    
}







