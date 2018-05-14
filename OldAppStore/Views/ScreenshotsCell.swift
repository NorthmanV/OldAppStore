//
//  ScreenshotsCell.swift
//  OldAppStore
//
//  Created by Руслан Акберов on 13.05.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class ScreenshotsCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var app: App? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let cellId = "cellID"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ScreenshotImageCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        addSubview(dividerLine)
        addconstraintsWithFormat("H:|[v0]|", views: collectionView)
        addconstraintsWithFormat("V:|[v0][v1(0.5)]|", views: collectionView, dividerLine)
        addconstraintsWithFormat("H:|-14-[v0]|", views: dividerLine)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = app?.screenshots?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotImageCell
        if let image = app?.screenshots?[indexPath.item] {
            cell.imageView.image = UIImage(named: image)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 240, height: frame.height - 28)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
}











