//
//  DetailSalon.swift
//  30Shine
//
//  Created by Do Ngoc Trinh on 7/21/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class DetailSalonView: UIView {

    @IBOutlet weak var lblAddress: UILabel!

    @IBOutlet weak var imvSelected: UIImageView!
    @IBOutlet weak var imvSalon1: UIImageView!
    @IBOutlet weak var imvSalon2: UIImageView!
    @IBOutlet weak var imgSalon3: UIImageView!
    
    @IBOutlet weak var imvMap: UIImageView!
    @IBOutlet weak var btnHotLine: UIButton!
    @IBOutlet weak var btnBooking: UIButton!
    @IBOutlet weak var btnFanpage: UIButton!
    
    static func createInView(view: UIView) -> DetailSalonView{
        let detailSalonView = NSBundle.mainBundle().loadNibNamed("DetailSalonView", owner: self, options: nil) [0] as! DetailSalonView
        view.layoutIfNeeded()
        detailSalonView.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)
        
        view.addSubview(detailSalonView)
        detailSalonView.alpha = 0
        UIView .animateWithDuration(0.2) {
            detailSalonView.alpha = 1
        }
        return detailSalonView
    }
    
    func setupButtons(){
        _=btnHotLine.rx_tap.subscribeNext({
            print("hotline")
        })
        
        _=btnBooking.rx_tap.subscribeNext({
            print("booking")
        })
        
        _=btnFanpage.rx_tap.subscribeNext({
            print("fanpage")
        })
        
    }
    
}
