//
//  HomeViewController.swift
//  30Shine
//
//  Created by Mr.Vu on 7/21/16.
//  Copyright © 2016 vu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {

    @IBOutlet weak var clvMenu: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imvSlide: UIImageView!
    
    var currentPage = 0
    let swipeGestureLeft = UISwipeGestureRecognizer()
    let swipeGestureRight = UISwipeGestureRecognizer()
    
    var slideImageVar : Variable<[String]> = Variable(["girl1","girl2","girl3"])
    var menuVariable  : Variable<[Menu]> = Variable([])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initData()
        self.configUI()
        self.configSilder()
        self.configCollectionView()
    }
    //MARK: UI
    func configUI() {
        self.pageControl.userInteractionEnabled = false
        self.imvSlide.userInteractionEnabled = true
        
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image:logo)
        imageView.frame = CGRectMake(0, 0, 64, 40)
        imageView.contentMode = .ScaleAspectFit
        self.navigationItem.titleView = imageView
        
        self.configColletionLayout()
    }
    
    func configColletionLayout() {
        self.view.layoutIfNeeded()
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let width = (self.view.frame.width - 25)/2 
        layout.itemSize = CGSizeMake(width, 1.1*width)
        self.clvMenu.setCollectionViewLayout(layout, animated: true)
    }
    
    //MARK: CollectioView
    func configCollectionView() {
        _ = self.menuVariable.asObservable().bindTo(self.clvMenu.rx_itemsWithCellIdentifier("MenuCell", cellType: MenuCell.self)) {
            row,data,cell in
            cell.imvMenu.image = UIImage(named: data.imageName)
            cell.lblTitle.text = "\(data.title)"
        }
    }
    
    //MARK: Silder banner
    func configSilder() {
        self.swipeGestureLeft.direction  = UISwipeGestureRecognizerDirection.Left
        self.swipeGestureRight.direction = UISwipeGestureRecognizerDirection.Right
        self.imvSlide.addGestureRecognizer(self.swipeGestureLeft)
        self.imvSlide.addGestureRecognizer(self.swipeGestureRight)
        self.swipeGestureRight.addTarget(self, action: #selector(HomeViewController.handleSwipeRight(_:)))
        self.swipeGestureLeft.addTarget(self, action: #selector(HomeViewController.handleSwipeLeft(_:)))
        self.chageImageForSlider()
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(self.autoNextSlide), userInfo: nil, repeats: true)

    }
    
    func chageImageForSlider() {
        UIView.animateWithDuration(0.2, animations: {
            self.imvSlide.image = UIImage(named: self.slideImageVar.value[self.pageControl.currentPage])

        })
    }
    
    func handleSwipeRight(gesture: UISwipeGestureRecognizer) {
        self.pageControl.currentPage -= 1
        self.currentPage -= 1
        if self.currentPage < 0 {
            self.pageControl.currentPage = 0
            self.currentPage = 0
        }
        self.chageImageForSlider()
    }
    
    func handleSwipeLeft(gesture: UISwipeGestureRecognizer) {
        
        self.pageControl.currentPage += 1
        self.currentPage += 1
        if self.currentPage == self.pageControl.numberOfPages {
            self.pageControl.currentPage = self.pageControl.numberOfPages - 1
            self.currentPage = self.pageControl.numberOfPages - 1
        }
        self.chageImageForSlider()
    }
    
    func autoNextSlide() {
        self.pageControl.currentPage += 1
        self.currentPage += 1
        if self.currentPage == self.pageControl.numberOfPages {
            self.pageControl.currentPage = 0
            self.currentPage = 0
        }
        self.chageImageForSlider()
    }
    
    //MARK: Dump Data
    func initData() {
        self.menuVariable.value.append(Menu.init(image: "tuvantoc", title: "Tư vấn kiểu tóc theo khuôn mặt"))
        self.menuVariable.value.append(Menu.init(image: "bosuutap", title: "Bộ sưu tập kiểu tóc mới nhất 2016"))
        self.menuVariable.value.append(Menu.init(image: "datlich", title: "Đặt lịch cắt tóc"))
        self.menuVariable.value.append(Menu.init(image: "video", title: "Video tóc ấn tượng"))
        self.menuVariable.value.append(Menu.init(image: "mypham", title: "Mỹ phẩm nam cao cấp"))
        self.menuVariable.value.append(Menu.init(image: "dichvu", title: "Dịch vụ & Hệ thống Salon"))
    }


}
