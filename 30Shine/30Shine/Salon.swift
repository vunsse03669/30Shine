//
//  Salon.swift
//  30Shine
//
//  Created by Do Ngoc Trinh on 7/21/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit

class Salon: NSObject {
    
    var imageSalonName : String = ""
    var address        : String = ""
    var managerName    : String = ""
    var hotLine        : String = ""
    var facebookLink   : String = ""
    
    
    init(imageSalonName: String, address : String, managerName : String, hotLine: String, facebookLink: String) {
        self.imageSalonName = imageSalonName;
        self.address = "\(address)";
        self.managerName = "\(managerName)";
        self.hotLine = "\(hotLine)";
        self.facebookLink = "\(facebookLink)";
    }
}
