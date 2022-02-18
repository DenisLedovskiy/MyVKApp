//
//  Friend.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 15.10.2021.
//

import UIKit
import RealmSwift
import Realm

//class Friend: Object {
//    @objc dynamic var name: String = ""
//    var avatar = UIImage()
//    var photos = [UIImage]()
//    @objc dynamic var id: Int = 0
//}

struct Friend {
    var name = String()
    var avatar = UIImage()
    var photos = [UIImage]()
    var id = Int()
}


