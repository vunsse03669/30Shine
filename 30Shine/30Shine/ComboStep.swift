//
//  ComboStep.swift
//  30Shine
//
//  Created by Do Ngoc Trinh on 7/25/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit

class ComboStep: NSObject {
    var imvUrl :String  = ""
    var textTitle : String = ""
    
    init(imvUrl : String, textTitle: String){
        self.imvUrl = imvUrl
        self.textTitle = textTitle
    }
}
