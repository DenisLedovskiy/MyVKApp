//
//  SimpleFactory.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 21.03.2022.
//

import UIKit

class FriendsViewModelFactory {

    func constructViewModels(from friends: FriendsResponse) -> [Friend] {
        return viewModel(from: friends)
    }

    func getImage(from url: String) -> UIImage? {
            var image: UIImage?
            guard let imageURL = URL(string: url) else { return nil }

            guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
            image = UIImage(data: imageData)

            return image
        }


    private func viewModel(from friend: FriendsResponse) -> [Friend] {

        var rezultFriendsArray = [Friend]()
        let friendsCount = friend.response?.items.count
        let friendsItems = friend.response?.items

        for i in 0...friendsCount! - 1 {

            let avatar = getImage(from: (friendsItems?[i].photo)!) ?? UIImage(named: "vk-social-network-logo")

            rezultFriendsArray.append(Friend(name: (friendsItems?[i].firstName)! + " " + (friendsItems?[i].lastName)!,
                                             avatar: avatar!, photos: [UIImage()], id: (friendsItems?[i].id)!))
        }

        rezultFriendsArray = rezultFriendsArray.sorted { $0.name.lowercased() < $1.name.lowercased() }

        return rezultFriendsArray
    }

}
