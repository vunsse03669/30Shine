//
//  ChainSystemViewController.swift
//  30Shine
//
//  Created by Do Ngoc Trinh on 7/21/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit
import NPSegmentedControl

class ChainSystemViewController: UIViewController {

    
    @IBOutlet weak var selector: NPSegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        let myElements = ["Dịch Vụ","Hệ thống"]
        selector.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        
        let indicatorImage = UIImageView(image: UIImage(named: "tabindicator"))
        indicatorImage.image = indicatorImage.image?.imageWithRenderingMode(.AlwaysTemplate)
        indicatorImage.tintColor = .redColor()
        selector.cursor = indicatorImage;
        
        selector.unselectedFont = UIFont(name: "UTM Alexander", size: 16)
        selector.selectedFont = UIFont(name: "UTM Alexander", size: 16)
        selector.unselectedTextColor = UIColor(white: 1, alpha: 0.8)
        selector.unselectedColor = UIColor(red: 10/255, green: 137/255, blue: 169/255, alpha: 0.8)
        selector.selectedTextColor = UIColor(white: 1, alpha: 1)
        selector.selectedColor = UIColor(red: 10/255, green: 137/255, blue: 169/255, alpha: 1)
        selector.cursorPosition = CursorPosition.Bottom
        
        selector.setItems(myElements)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
