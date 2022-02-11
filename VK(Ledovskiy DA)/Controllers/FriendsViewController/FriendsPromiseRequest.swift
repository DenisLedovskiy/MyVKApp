//
//  FriendsPromiseRequest.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 11.02.2022.
//

import Foundation
//import PromiseKit
//import UIKit
//
//class FriendsPromiseRequest {
//
//    let session = Session.instance
//
//    func getImage(from url: String) -> UIImage? {
//            var image: UIImage?
//            guard let imageURL = URL(string: url) else { return nil }
//
//            guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
//            image = UIImage(data: imageData)
//
//            return image
//        }
//
//    func getDataFriends() -> Promise<Data> {
//        return Promise<Data> { seal in
//
//            let urlFriends = URL(string: "http://api.vk.com/method/friends.get?v=5.81&access_token=\(session.token)&count=50&fields=nickname,photo_50")
//
//            guard let data = try? Data(contentsOf: urlFriends!) else {return}
//            seal.fulfill(data)
//        }
//    }
//
//    func decodeJSON(for data: Data) -> Promise<FriendsResponse> {
//        return Promise<FriendsResponse> {seal in
//
//            if let dataJSON = data as? Data {
//                do {
//                    let friends = try JSONDecoder().decode(FriendsResponse.self, from: data)
//                    seal.fulfill(friends)
//
//                } catch {
//                    seal.reject(error)
//                }
//            }
//        }
//    }
//
//    func fillFrieandsArray(for friends: FriendsResponse) -> Promise<[Friend]> {
//        return Promise<[Friend]> { seal in
//
//            var friendArrayPromise = [Friend]()
//
//            let friend = friends.response?.items
//            let friendsCount = friends.response?.items.count
//
//            for i in 0...friendsCount! - 1 {
//                guard let avatar = getImage(from: (friend?[i].photo)!) else { return }
//
//                friendArrayPromise.append(Friend(name: (friend?[i].firstName)! + (friend?[i].lastName)!, avatar: avatar,
//                                          photos: [UIImage()], id: (friend?[i].id)!))
//            }
//
//            friendArrayPromise = friendArrayPromise.sorted { $0.name.lowercased() < $1.name.lowercased() }
//            seal.fulfill(friendArrayPromise)
//        }
//    }
//}
//
//
