//
//  OtherServicesView.swift
//  30Shine
//
//  Created by Do Ngoc Trinh on 7/22/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit

class OtherServicesView: UIView {

    static func createInView(view: UIView) -> OtherServicesView{
        let otherServicesView = NSBundle.mainBundle().loadNibNamed("OtherServicesView", owner: self, options: nil) [0] as! OtherServicesView
        view.layoutIfNeeded()
        otherServicesView.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)
        
        view.addSubview(otherServicesView)
        otherServicesView.alpha = 0
        UIView .animateWithDuration(0.2) {
            otherServicesView.alpha = 1
        }
        return otherServicesView
    }

}
