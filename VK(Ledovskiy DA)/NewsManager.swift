//
//  NewsManager.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 01.02.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class NewsManager {

    let session = Session.instance

    func get (_ completion: @escaping (NewsInitialResponse?) -> ()) {

        AF.request("https://api.vk.com/method/newsfeed.get", parameters: [
            "v": "5.81",
            "access_token": session.token,
            "count": 5,
            "filters": "post"
        ]).responseData { response in

            guard let data = response.data else {return}

            let decoder = JSONDecoder()
            let json = JSON(data)
            let dispatchGroup = DispatchGroup()

            let vkItemsJSONArr = json["response"]["items"].arrayValue
            let vkProfilesJSONArr = json["response"]["profiles"].arrayValue
            let vkGroupsJSONArr = json["response"]["groups"].arrayValue

            var vkItemArray: [NewsItems] = []
            var vkProfilesArray: [NewsProfiles] = []
            var vkGroupsArray: [NewsGroups] = []

            DispatchQueue.global().async(group: dispatchGroup) {
                for (index, item) in vkItemsJSONArr.enumerated() {
                    do {
                        let decodedItem = try decoder.decode(NewsItems.self, from: item.rawData())
                        vkItemArray.append(decodedItem)

                    } catch(let errorDecode) {
                        print("Item desoding error at index \(index), err: \(errorDecode)")
                    }
                }
            }

            DispatchQueue.global().async(group: dispatchGroup) {
                for (index, item) in vkProfilesJSONArr.enumerated() {
                    do {
                        let decodedItem = try decoder.decode(NewsProfiles.self, from: item.rawData())
                        vkProfilesArray.append(decodedItem)

                    } catch(let errorDecode) {
                        print("Item desoding error at index \(index), err: \(errorDecode)")
                    }
                }
            }

            DispatchQueue.global().async(group: dispatchGroup) {
                for (index, item) in vkGroupsJSONArr.enumerated() {
                    do {
                        let decodedItem = try decoder.decode(NewsGroups.self, from: item.rawData())
                        vkGroupsArray.append(decodedItem)

                    } catch(let errorDecode) {
                        print("Item desoding error at index \(index), err: \(errorDecode)")
                    }
                }
            }

            dispatchGroup.notify(queue: DispatchQueue.main) {
                let response = NewsResponse(items: vkItemArray,
                                            profiles: vkProfilesArray,
                                            groups: vkGroupsArray)
                let feed = NewsInitialResponse(response: response)

                completion(feed)
            }
        }
    }
    
}
