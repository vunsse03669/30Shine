//
//  ChainSystemViewController.swift
//  30Shine
//
//  Created by Do Ngoc Trinh on 7/21/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit
import NPSegmentedControl
import RxSwift
import RxCocoa

class ChainSystemViewController: UIViewController {

    
    @IBOutlet weak var selector: NPSegmentedControl!
     var listSalonView : ListSalonView!
    
    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSelector()
        setupContent()

    }
    
    func setupSelector(){
        let myElements = ["Dịch Vụ","Hệ thống Salon"]
        
        let indicatorImage = UIImageView(image: UIImage(named: "tabindicator"))
        indicatorImage.image = indicatorImage.image?.imageWithRenderingMode(.AlwaysTemplate)
        indicatorImage.tintColor = UIColor(red: 240/255, green: 241/255, blue: 242/255, alpha: 1)
        selector.cursor = indicatorImage;
        let customFont = UIFont(name: "UTM-Alexander", size: 17)
        selector .unselectedFont = customFont;
        selector.selectedFont = customFont;
        selector.unselectedTextColor = UIColor(red: 137/255, green: 136/255, blue: 136/255, alpha: 1)
        selector.unselectedColor = UIColor(red: 240/255, green: 241/255, blue: 242/255, alpha: 1)
        selector.selectedTextColor = UIColor(red: 11/255, green: 11/255, blue: 11/255, alpha: 1)
        selector.selectedColor = UIColor(red: 240/255, green: 241/255, blue: 242/255, alpha: 1)
        selector.backgroundColor = .clearColor()
        selector.cursorPosition = CursorPosition.Bottom
        
        selector.setItems(myElements)
    }
    
    func setupContent(){

         self.listSalonView = NSBundle.mainBundle().loadNibNamed("ListSalonView", owner: self, options: nil) [0] as! ListSalonView
        self.view.layoutIfNeeded()
        listSalonView.frame = CGRectMake(0, 0, contentView.frame.size.width, contentView.frame.size.height)
        contentView.addSubview(listSalonView)
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
