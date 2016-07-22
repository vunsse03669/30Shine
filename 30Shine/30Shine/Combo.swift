//
//  Combo.swift
//  30Shine
//
//  Created by Do Ngoc Trinh on 7/22/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit

class Combo: NSObject {
    var imageBackgorund : String = ""
    var textPrice   : String = ""

    init(imageBackgorund: String, textPrice: String) {
        self.imageBackgorund = imageBackgorund
        self.textPrice = textPrice
    }
}
