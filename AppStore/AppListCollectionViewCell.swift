//
//  AppListCollectionViewCell.swift
//  AppStore
//
//  Created by 臧其龙 on 16/2/29.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

private let kAppCell = "kAppCell"

class AppListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var showAllButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subCollectionView: UICollectionView!
    
    var dataSource = [AppModel]() {
        didSet {
            subCollectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
}

extension AppListCollectionViewCell:UICollectionViewDataSource, UICollectionViewDelegate {

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kAppCell, forIndexPath: indexPath) as! AppCollectionViewCell
        
        let model = dataSource[indexPath.row]
        
        cell.appImageView.image = model.image
        cell.appNameLabel.text = "\(indexPath.row)"
        
        return cell
    
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
}