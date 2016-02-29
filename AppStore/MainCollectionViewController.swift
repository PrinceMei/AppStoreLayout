//
//  MainCollectionViewController.swift
//  AppStore
//
//  Created by 臧其龙 on 16/2/29.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

private let kAppListCell = "kAppListCell"

class MainCollectionViewController: UICollectionViewController {
    
    var modelArray = [AppModel]()
    var contentOffsetArray = [NSIndexPath: CGFloat]()

    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 0..<10  {
            let image = UIImage(named: "wuyanzu.jpg")!
            let title = "码农界吴彦祖"
            
            let model = AppModel(image: image, title: title)
            
            modelArray.append(model)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return modelArray.count
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kAppListCell, forIndexPath: indexPath) as! AppListCollectionViewCell
    
        cell.dataSource = modelArray
        cell.titleLabel.text = "Example"
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        if let displayCell = cell as? AppListCollectionViewCell
        {
            if let offset = contentOffsetArray[indexPath] {
                displayCell.subCollectionView.contentOffset.x = offset
            }else
            {
                displayCell.subCollectionView.contentOffset.x = 0
            }
            
        }
        
    }
    
    override func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
         if let endDisplayCell = cell as? AppListCollectionViewCell
         {
            
            contentOffsetArray[indexPath] = endDisplayCell.subCollectionView.contentOffset.x
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
