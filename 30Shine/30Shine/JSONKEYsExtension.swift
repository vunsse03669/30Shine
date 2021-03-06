//
//  JSONKEYsExtension.swift
//  30Shine
//
//  Created by Mr.Vu on 7/23/16.
//  Copyright © 2016 vu. All rights reserved.
//

import Foundation
import JASON

extension JSONKeys {
    //home
    static let id = JSONKey<Int>("Id")
    static let name = JSONKey<String>("Name")
    static let description = JSONKey<String>("Description")
    static let thumb = JSONKey<JSON>("Thumb")
    static let imageUrl =  JSONKey<String>("url")
    static let image = JSONKey<JSON>("Image")
    
    //customer history
    static let billCreatedTime = JSONKey<String>("billCreatedTime")
    static let stylistName = JSONKey<String>("stylistName")
    static let skinnerName = JSONKey<String>("skinnerName")
    static let rating = JSONKey<String>("rating")
    static let services = JSONKey<JSON>("services")
    

    //Chain System
    static let salon_Id      =      JSONKey<String>("Id")
    static let salon_fanpage =      JSONKey<String>("Fanpage")
    static let salon_phone =        JSONKey<String>("Phone")
    static let salon_managerName =   JSONKey<String>("ManagerName")
    static let salon_images =       JSONKey<JSON>("Images")
    static let salon_videos =       JSONKey<JSON>("Videos")   
    static let salon_imageThumb =   JSONKey<String>("thumb")
    static let salon_title =        JSONKey<String>("title")
    static let salon_description =  JSONKey<String>("description")

    // hair colletion
    static let images = JSONKey<JSON>("Images")
    static let title = JSONKey<String>("Title")

}
