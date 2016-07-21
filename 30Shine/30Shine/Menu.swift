//
//  Menu.swift
//  30Shine
//
//  Created by Mr.Vu on 7/21/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit

class Menu: NSObject {
    
    var imageName : String = ""
    var title     : String = ""
    
    init(image: String, title : String) {
        self.imageName = image
        self.title = title
    }

}
