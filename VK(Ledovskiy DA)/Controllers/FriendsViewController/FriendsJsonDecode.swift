//
//  FriendsJsonDecode.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 08.02.2022.
//

import Foundation
import UIKit

class FriendsJsonDecode: Operation {

    var friendArray = [Friend]()

    func getImage(from url: String) -> UIImage? {
            var image: UIImage?
            guard let imageURL = URL(string: url) else { return nil }

            guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
            image = UIImage(data: imageData)

            return image
        }

    func fillFriendsArray(_ friendsInitialResponse: FriendsResponse) {

        let friendsCount = friendsInitialResponse.response?.items.count
        let friends = friendsInitialResponse.response?.items

        for i in 0...friendsCount! - 1 {
            guard let avatar = getImage(from: (friends?[i].photo)!) else { return }

            friendArray.append(Friend(name: (friends?[i].firstName)! + (friends?[i].lastName)!, avatar: avatar, photos: [UIImage()], id: (friends?[i].id)!))
        }

        friendArray = friendArray.sorted { $0.name.lowercased() < $1.name.lowercased() }
    }

    override func main() {

        guard let friendData = dependencies.first as? FriendsRequest,
              let data = friendData.data as? Data else {return}

        do {
            let friends = try JSONDecoder().decode(FriendsResponse.self, from: data)
            fillFriendsArray(friends)
        } catch(let error) {
            print(error)
        }
        
    }

}


