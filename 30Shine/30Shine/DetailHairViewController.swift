//
//  DetailHairViewController.swift
//  30Shine
//
//  Created by Mr.Vu on 7/25/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

class DetailHairViewController: UIViewController {
    
    @IBOutlet weak var clvMenu: UICollectionView!
    @IBOutlet weak var btnProfile: UIButton!
    @IBOutlet weak var btnHome: UIButton!
    
    var menuVar : Variable<[HairType]> = Variable([])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.configCollectionView()
        
        _ = btnHome.rx_tap.subscribeNext {
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    //MARK: UI
    func configUI() {
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image:logo)
        imageView.frame = CGRectMake(0, 0, 64, 40)
        imageView.contentMode = .ScaleAspectFit
        self.navigationItem.titleView = imageView
        self.configCollectionLayout()
    }
    
    //MARK: Collection view
    func configCollectionView() {
        _ = self.menuVar.asObservable().bindTo(self.clvMenu.rx_itemsWithCellIdentifier("MenuCollectionViewCell", cellType: MenuCollectionViewCell.self)) {row,data,cell in
            cell.lblTitle.text = "\(data.title)"
        }
    }
    
    func configCollectionLayout() {
        self.view.layoutIfNeeded()
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let width = self.view.bounds.width/3
        let height = self.clvMenu.bounds.height
        layout.itemSize = CGSizeMake(width, height)
        layout.scrollDirection = .Horizontal
        self.clvMenu.setCollectionViewLayout(layout, animated: true)
    }
}
