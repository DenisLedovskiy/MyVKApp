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
    var nextFrom = ""
    var isLoading = false


    func get (startTime: Int,
              startFrom: String = "",
              _ completion: @escaping ((NewsInitialResponse?), (String)) -> ()) {

        AF.request("https://api.vk.com/method/newsfeed.get", parameters: [
            "v": "5.81",
            "access_token": session.token,
            "count": 5,
            "filters": "post",
            "start_from": startFrom
        ]).responseData { response in

            guard let data = response.data else {return}

            let decoder = JSONDecoder()
            let json = JSON(data)
            let dispatchGroup = DispatchGroup()
            var textAt = ""
            var sourseIdAt = 0
            var dateAt = 0

            let vkItemsJSONArr = json["response"]["items"].arrayValue
            let vkProfilesJSONArr = json["response"]["profiles"].arrayValue
            let vkGroupsJSONArr = json["response"]["groups"].arrayValue
            let nextFrom = json["response"]["next_from"].stringValue
            let sizePhotoJsonArr = json["response"]["items"]["attachments"]["photo"]["sizes"].arrayValue


            var vkItemArray: [NewsItems] = []
            var vkProfilesArray: [NewsProfiles] = []
            var vkGroupsArray: [NewsGroups] = []
            var vkSizesPhotoArray: [NewsPhotoSizes] = []

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

            DispatchQueue.global().async(group: dispatchGroup) {
                for (index, item) in sizePhotoJsonArr.enumerated() {
                    do {
                        let decodedItem = try decoder.decode(NewsPhotoSizes.self, from: item.rawData())
                        vkSizesPhotoArray.append(decodedItem)

                    } catch(let errorDecode) {
                        print("Item desoding error at index \(index), err: \(errorDecode)")
                    }
                }
            }

            dispatchGroup.notify(queue: DispatchQueue.main) {

                let photo = NewsPhoto(sizes: vkSizesPhotoArray)
                let attachnments = [NewsAttachents(photo: photo)]
                let vkItemArray = [NewsItems(source_id: sourseIdAt, date: dateAt, text: textAt, attachments: attachnments)]
                let response = NewsResponse(items: vkItemArray,
                                            profiles: vkProfilesArray,
                                            groups: vkGroupsArray,
                                            next_from: nextFrom)
                let feed = NewsInitialResponse(response: response)

                completion(feed, nextFrom)
            }
        }
    }
    
}
