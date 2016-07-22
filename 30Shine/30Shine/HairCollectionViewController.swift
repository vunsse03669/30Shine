//
//  HairCollectionViewController.swift
//  30Shine
//
//  Created by Mr.Vu on 7/22/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HairCollectionViewController: UIViewController {

    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnProfile: UIButton!
    @IBOutlet weak var tbvHairType: UITableView!
    
    var hairTypeVariable : Variable<[HairType]> = Variable([])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.initData()
        self.configTableView()
        //back to home
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
    }
    
    //MARK: Tableview
    func configTableView() {
        _ = self.hairTypeVariable.asObservable().bindTo(self.tbvHairType.rx_itemsWithCellIdentifier("HairTypeCell", cellType: HairTypeCell.self)) {
            row,data,cell in
            cell.lblTitle.text = "\(data.title)"
            cell.lblDescription.text = "\(data.script)"
            cell.imvImage.image = UIImage(named: data.imageName)
        }
    }
    
    //MARK: Dump data
    func initData() {
        self.hairTypeVariable.value.append(HairType(title: "Slick-Back Undercut", script: "Undercut  vuốt ngược", imageName: "slick-back.jpg"))
        self.hairTypeVariable.value.append(HairType(title: "Slick-Swept Undercut", script: "Undercut vuốt lệch", imageName: "slick-swept.jpg"))
        self.hairTypeVariable.value.append(HairType(title: "Long-Top Quiff", script: "Mái dài vuốt bồng bềnh", imageName: "long-top.jpg"))
        self.hairTypeVariable.value.append(HairType(title: "Quiff-Undercut", script: "Undercut với mái bồng", imageName: "quiff-undercut.jpg"))
        self.hairTypeVariable.value.append(HairType(title: "Side Part", script: "Ngôi lệch hiện đại", imageName: "side-part.jpg"))
        self.hairTypeVariable.value.append(HairType(title: "Middle Part", script: "Ngôi giữa hiện đại", imageName: "middle-part.jpg"))
        self.hairTypeVariable.value.append(HairType(title: "Short Quiff/Sport", script: "Tóc ngắn vuốt dựng", imageName: "sport.jpg"))
        self.hairTypeVariable.value.append(HairType(title: "Layer", script: "Mái dài tỉa lớp", imageName: "layer.jpg"))
    }
}
