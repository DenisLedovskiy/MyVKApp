//
//  Session.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 20.11.2021.
//

import Foundation

class Session {

    private init () {}

    static let instance = Session()

    var token: String = ""
    var userId: Int = 0

}

