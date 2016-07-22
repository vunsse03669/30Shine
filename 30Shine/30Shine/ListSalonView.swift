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
    var detailSalonView : DetailSalonView!
    override func awakeFromNib() {
        initData()
        configCollectionView()
    }
    
    static func createInView(view: UIView) -> ListSalonView{
        let listSalonView = NSBundle.mainBundle().loadNibNamed("ListSalonView", owner: self, options: nil) [0] as! ListSalonView
        view.layoutIfNeeded()
        listSalonView.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)
        
        view.addSubview(listSalonView)
        listSalonView.alpha = 0
        UIView .animateWithDuration(0.2) {
            listSalonView.alpha = 1
        }
        return listSalonView
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
        _ =           self.salonVariable.asObservable().bindTo(self.tbvListSalon.rx_itemsWithCellIdentifier("SalonTableCell", cellType: SalonTableCell.self)){
            row,data,cell in
            cell.lblAdress.text = data.address
            cell.lblManager.text = data.managerName
            cell.lblHotLine.text = data.hotLine
            cell.lblFacebookLink.text = data.facebookLink
        }
        _ = self.tbvListSalon.rx_itemSelected.subscribeNext {
            indexPath in
            self.tbvListSalon.deselectRowAtIndexPath(indexPath, animated: false)
            let salon = self.salonVariable.value[indexPath.row]
            self.showDetail(salon)
        }
    }
    
    func showDetail(salon:Salon){
        self.detailSalonView = NSBundle.mainBundle().loadNibNamed("DetailSalonView", owner: self, options: nil) [0] as! DetailSalonView
        self.detailSalonView.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        self.addSubview(self.detailSalonView)
        self.detailSalonView.alpha = 0
        UIView .animateWithDuration(0.2) {
            self.detailSalonView.alpha = 1
        }
    }
    
    func disappearDetail(){
        UIView .animateWithDuration(0.5, animations: {
            self.detailSalonView.alpha = 0
        }) { (completion) in
            self.detailSalonView.removeFromSuperview()
        }
    }
}
