//
//  OtherServicesView.swift
//  30Shine
//
//  Created by Do Ngoc Trinh on 7/22/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class ShineComboView: UIView {
    
    @IBOutlet weak var clvSteps: UICollectionView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var viewVideo: UIView!
    @IBOutlet weak var btnPlayVideo: UIButton!
    @IBOutlet weak var imvThumbnail: UIImageView!
    var videoUrl : String = ""
    var comboSteps : Variable<[ComboStep]> = Variable([])
    
    static func createInView(view: UIView) -> ShineComboView{
        let shineComboView = NSBundle.mainBundle().loadNibNamed("ShineComboView", owner: self, options: nil) [0] as! ShineComboView
        view.layoutIfNeeded()
        shineComboView.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)
        
        view.addSubview(shineComboView)
        shineComboView.fadeIn(0.2)
        
        shineComboView.setupContent()
        shineComboView.setupCollectionView()
        
        return shineComboView
    }
    
    func setupContent(){
        let comboStep : ComboStep = ComboStep(imvUrl: "girl2",textTitle: "bla bla bla blal bla bla blba")
        comboSteps.value.append(comboStep)
        comboSteps.value.append(comboStep)
        comboSteps.value.append(comboStep)
        comboSteps.value.append(comboStep)
        comboSteps.value.append(comboStep)
        comboSteps.value.append(comboStep)
        comboSteps.value.append(comboStep)
        comboSteps.value.append(comboStep)
    }
    
    func setupCollectionView(){
        //register nib
        self.clvSteps.registerNib(UINib.init(nibName: "ComboCell", bundle: nil), forCellWithReuseIdentifier: "ComboCell")
        
        //config layout
        let flowLayout: UICollectionViewFlowLayout! = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        let width = self.frame.width/2 - 12
        let height = width*0.8
        flowLayout.itemSize = CGSizeMake(width, height)
        flowLayout.minimumLineSpacing = 8
        flowLayout.minimumInteritemSpacing = 8
        self.clvSteps.setCollectionViewLayout(flowLayout, animated: false)
        
        //datasource
        _ = self.comboSteps.asObservable().bindTo(self.clvSteps.rx_itemsWithCellIdentifier("ComboCell", cellType: ComboCell.self)){
            row, data, cell in
            cell.lblTitle.text = data.textTitle
            //cell.imvBackground.image = UIImage(named: data.imvUrl)
        }
    }
    
}
