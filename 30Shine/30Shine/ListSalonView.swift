//
//  ListSalonView.swift
//  30Shine
//
//  Created by Do Ngoc Trinh on 7/21/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ListSalonView: UIView {
    
    @IBOutlet weak var tbvListSalon: UITableView!
    
    var salonVariable  : Variable<[Salon]> = Variable([])
    override func awakeFromNib() {
        initData()
        configCollectionView()
    }
    
    func initIn(view: UIView){
        
    }
    func initData(){
        let newSalon : Salon = Salon.init(imageSalonName: "image", address: "30SHINE 82 TRAN DAI NGHIA", managerName: "Nguyen Van Anh", hotLine: "012345678900", facebookLink: "www.facebook.com/30Shinetdn")
        salonVariable.value.append(newSalon)
        salonVariable.value.append(newSalon)
        salonVariable.value.append(newSalon)
        salonVariable.value.append(newSalon)
        salonVariable.value.append(newSalon)
    }
    func configCollectionView() {
        tbvListSalon.registerNib(UINib.init(nibName: "SalonTableCell", bundle: nil), forCellReuseIdentifier: "SalonTableCell")
        tbvListSalon.rowHeight = 120
        _ =
            self.salonVariable.asObservable().bindTo(self.tbvListSalon.rx_itemsWithCellIdentifier("SalonTableCell", cellType: SalonTableCell.self)){
                row,data,cell in
                cell.lblAdress.text = data.address
                cell.lblManager.text = data.managerName
                cell.lblHotLine.text = data.hotLine
                cell.lblFacebookLink.text = data.facebookLink
        }
    }
}
