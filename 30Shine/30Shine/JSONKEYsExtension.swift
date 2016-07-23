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
}
