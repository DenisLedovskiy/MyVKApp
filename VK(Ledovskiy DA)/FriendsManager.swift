//
//  FriendsManager.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 25.03.2022.
//

import Foundation

protocol FriendsManagerProtocol {

    func loadFriends()
}

class FriendsManager: FriendsManagerProtocol {

    let session = Session.instance
    let friendsFactory = FriendsViewModelFactory()

    func loadFriends() {

        let urlFriends = URL(string: "http://api.vk.com/method/friends.get?v=5.81&access_token=\(session.token)&count=50&fields=nickname,photo_50")

        let task = URLSession.shared.dataTask(with: urlFriends!) { data, response, error in
            do {
                let friends = try JSONDecoder().decode(FriendsResponse.self, from: data!)
                self.friendsFactory.constructViewModels(from: friends)
            } catch(let error) {
                print(error)
            }
        }
        task.resume()
    }
}


