//
//  AppModel.swift
//  AppStore
//
//  Created by 臧其龙 on 16/2/29.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import Foundation
import UIKit

struct AppModel {
    
    var image:UIImage
    var title:String
    
    init(image:UIImage, title:String)
    {
        self.image = image
        self.title = title
    }
}