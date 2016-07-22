//
//  HairType.swift
//  30Shine
//
//  Created by Mr.Vu on 7/22/16.
//  Copyright © 2016 vu. All rights reserved.
//

import Foundation

class HairType: NSObject {
    var imageName : String!
    var title     : String!
    var script    : String!
    
    init(title: String, script : String, imageName : String) {
        self.title = title
        self.script = script
        self.imageName = imageName
    }
}
