//
//  Adapter.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 21.03.2022.
//

import Foundation


final class FriendsAdapter {

    var friendsManager = FriendsManager()

    func getFriends (completion: @escaping ([Friend]?) -> Void) {

        friendsManager.loadFriends()
    }
}
