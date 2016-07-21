//
//  VideoViewController.swift
//  30Shine
//
//  Created by Mr.Vu on 7/21/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class VideoViewController: UIViewController {
    
    @IBOutlet weak var tbvVideo: UITableView!
    @IBOutlet weak var btnHome: UIButton!
    
    var videoVariable : Variable<[Video]> = Variable([])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initData()
        self.configUI()
        //back to home
        self.configTableView()
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
    
    //MARK: TableView
    func configTableView() {
        _ = self.videoVariable.asObservable().bindTo(self.tbvVideo.rx_itemsWithCellIdentifier("VideoCell", cellType: VideoCell.self)) {
            row,data,cell in
            cell.lblTitle.text = "\(data.title)"
            LazyImage.showForImageView(cell.imvThumnail, url: self.getVideoId(data.thumnailUrl))
        }
        
        _ = self.tbvVideo.rx_itemSelected.subscribeNext {
            indexPath in
            
        }
    }
    
    //MARK: Youtube
    func getVideoId(url : String) -> String {
        var str = ""
        let urlStr = "http://img.youtube.com/vi/MASK_ID/0.jpg"
        for c in url.characters {
            str.append(c)
            if c == "=" {
                break
            }
        }
        let id = url.stringByReplacingOccurrencesOfString(str, withString: "")
        return urlStr.stringByReplacingOccurrencesOfString("MASK_ID", withString: id)
    }

    //MARK:Dump data
    func initData() {
        self.videoVariable.value.append(Video.init(title: "Cắt tạo kiểu Side Part | Phong cách Chanyeol (EXO) | Minh Phụng ", thumb: "https://www.youtube.com/watch?v=Q4to0oI2N-A"))
        self.videoVariable.value.append(Video.init(title: "Cắt tạo kiểu Side Swept | Hồ Gia Hùng - HKT Band ", thumb: "https://www.youtube.com/watch?v=VgNELJELfDE"))
        self.videoVariable.value.append(Video.init(title: "Cắt tạo kiểu Side Part | Phong cách TAO (EXO) | Ubin-G ", thumb: "https://www.youtube.com/watch?v=AX2HSXMNAGA"))
        self.videoVariable.value.append(Video.init(title: "Cắt tạo kiểu Undercut Quiff | Phong cách Marco Reus | Hoàng Giang ", thumb: "https://www.youtube.com/watch?v=y-CeDeXSFMU"))
        self.videoVariable.value.append(Video.init(title: " Cắt tạo kiểu Layer | Phong cách Luhan (EXO) | Quang Hưng ", thumb: "https://www.youtube.com/watch?v=AgnFqNt_lfQ"))
    }
    
}
