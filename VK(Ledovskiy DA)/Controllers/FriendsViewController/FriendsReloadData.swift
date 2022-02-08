//
//  FriendsReloadData.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 08.02.2022.
//

import Foundation

class FriendsReloadData: Operation {

    var friendsViewController: FriendsViewController

    override func main() {
        print("3st step")

        guard let parsedFriendsData = dependencies.first as? FriendsJsonDecode,
              let friendsList = parsedFriendsData.friendArray as? [Friend] else {return}

        friendsViewController.friendArray = friendsList
        friendsViewController.tableView.reloadData()
    }

    init(controller: FriendsViewController) {
        self.friendsViewController = controller
    }
}
