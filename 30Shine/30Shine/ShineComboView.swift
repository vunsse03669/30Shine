//
//  ShineCombo.swift
//  30Shine
//
//  Created by Do Ngoc Trinh on 7/22/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ShineComboView: UIView , UITableViewDelegate{

    
    @IBOutlet weak var tbvListCombo: UITableView!
    
    var comboVariables : Variable<[Combo]> = Variable([])
    
    static func createInView(view: UIView) -> ShineComboView{
        let shineComboView = NSBundle.mainBundle().loadNibNamed("ShineComboView", owner: self, options: nil) [0] as! ShineComboView
        view.layoutIfNeeded()
        shineComboView.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)
        
        view.addSubview(shineComboView)
        shineComboView.alpha = 0
        UIView .animateWithDuration(0.2) {
            shineComboView.alpha = 1
        }
        shineComboView.setupTableView()
        return shineComboView
    }
    
    
    func setupContent(){
        let combo : Combo = Combo(imageBackgorund: "girl1", textPrice: "bla bla bla bla bla - 100k")
        comboVariables.value.append(combo)
        comboVariables.value.append(combo)
        comboVariables.value.append(combo)
        comboVariables.value.append(combo)
    }
    
    func setupTableView(){
        
        setupContent()
        self.tbvListCombo.rowHeight = 100;
         self.tbvListCombo.registerNib(UINib.init(nibName: "ShineComboCell", bundle: nil), forCellReuseIdentifier: "ShineComboCell")
        self.tbvListCombo.setEditing(false, animated: false)
        _ = self.comboVariables.asObservable().bindTo(self.tbvListCombo.rx_itemsWithCellIdentifier("ShineComboCell", cellType: ShineComboCell.self)){
            row, data, cell in
            cell.btnPrice.text = data.textPrice
            cell.imvBackground.image = UIImage(named: data.imageBackgorund)
        }
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.None
    }

}
