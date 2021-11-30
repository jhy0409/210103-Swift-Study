//
//  BountyInfo.swift
//  BountyList
//
//  Created by inooph on 2021/11/30.
//  Copyright © 2021 com.joonwon. All rights reserved.
//

import UIKit

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
