//
//  NewsViewController.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 31.10.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

enum PostCellType: Int, CaseIterable {
    case author = 0
    case text
    case photo
    case likeCount
}

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let session = Session.instance
    var newsManager = NewsManager()

    var newsItemsPostArray = [NewsItems]()
    var newsProfilesPostArray = [NewsProfiles]()
    var newsGroupsPostArray = [NewsGroups]()
    
    var newsArray = [News]()
    let reuseIdentifierNews = "reuseIdentifierNews"
    let reuseIdentifierAvatar = "reuseIdentifierAvatar"
    let reuseIdentifierTextNews = "reuseIdentifierTextNews"
    let reuseIdentifierImageConetnt = "reuseIdentifierImageConetnt"
    let reuseIdentifierLikes = "reuseIdentifierLikes"

    func fillNewsArray () {
        let news1 = News(avatarNews: UIImage(named: "meganAva")!, titleNews: "Меган Фокс", textNews: "Теперь у меня есть замечательные котята)", contentImageNews: UIImage(named: "news1")!, counterLikeNews: "100")
        let news2 = News(avatarNews: UIImage(named: "ronaldoAva")!, titleNews: "Криштиано Роналдо", textNews: "Зацените мою новую тачку!", contentImageNews: UIImage(named: "news2")!, counterLikeNews: "57")

        newsArray.append(news1)
        newsArray.append(news2)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fillNewsArray()
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil),
                           forCellReuseIdentifier: reuseIdentifierNews)
        tableView.register(UINib(nibName: "Avatar+Name", bundle: nil),
                           forCellReuseIdentifier: reuseIdentifierAvatar)
        tableView.register(UINib(nibName: "TextNews", bundle: nil),
                           forCellReuseIdentifier: reuseIdentifierTextNews)
        tableView.register(UINib(nibName: "ImageContentNews", bundle: nil),
                           forCellReuseIdentifier: reuseIdentifierImageConetnt)
        tableView.register(UINib(nibName: "LikesCell", bundle: nil),
                           forCellReuseIdentifier: reuseIdentifierLikes)

        DispatchQueue.main.async { [self] in

            newsManager.get { feed in
                newsItemsPostArray = (feed?.response.items)!
                newsProfilesPostArray = (feed?.response.profiles)!
                newsGroupsPostArray = (feed?.response.groups)!
                tableView.reloadData()
                print(newsItemsPostArray)
            }
        }
        tableView.delegate = self
        tableView.dataSource = self
    }

//    func get (_ completion: @escaping (NewsInitialResponse?) -> ()) {
//
//        AF.request("https://api.vk.com/method/newsfeed.get", parameters: [
//            "v": "5.81",
//            "access_token": session.token,
//            "count": 5,
//            "filters": "post"
//        ]).responseData { response in
//
//            guard let data = response.data else {return}
//
//            let decoder = JSONDecoder()
//            let json = JSON(data)
//            let dispatchGroup = DispatchGroup()
//
//            let vkItemsJSONArr = json["response"]["items"].arrayValue
//            let vkProfilesJSONArr = json["response"]["profiles"].arrayValue
//            let vkGroupsJSONArr = json["response"]["groups"].arrayValue
//
//            var vkItemArray: [NewsItems] = []
//            var vkProfilesArray: [NewsProfiles] = []
//            var vkGroupsArray: [NewsGroups] = []
//
//            DispatchQueue.global().async(group: dispatchGroup) {
//                for (index, item) in vkItemsJSONArr.enumerated() {
//                    do {
//                        let decodedItem = try decoder.decode(NewsItems.self, from: item.rawData())
//                        vkItemArray.append(decodedItem)
//
//                    } catch(let errorDecode) {
//                        print("Item desoding error at index \(index), err: \(errorDecode)")
//                    }
//                }
//            }
//
//            DispatchQueue.global().async(group: dispatchGroup) {
//                for (index, item) in vkProfilesJSONArr.enumerated() {
//                    do {
//                        let decodedItem = try decoder.decode(NewsProfiles.self, from: item.rawData())
//                        vkProfilesArray.append(decodedItem)
//
//                    } catch(let errorDecode) {
//                        print("Item desoding error at index \(index), err: \(errorDecode)")
//                    }
//                }
//            }
//
//            DispatchQueue.global().async(group: dispatchGroup) {
//                for (index, item) in vkGroupsJSONArr.enumerated() {
//                    do {
//                        let decodedItem = try decoder.decode(NewsGroups.self, from: item.rawData())
//                        vkGroupsArray.append(decodedItem)
//
//                    } catch(let errorDecode) {
//                        print("Item desoding error at index \(index), err: \(errorDecode)")
//                    }
//                }
//            }
//
//            dispatchGroup.notify(queue: DispatchQueue.main) {
//                let response = NewsResponse(items: vkItemArray,
//                                            profiles: vkProfilesArray,
//                                            groups: vkGroupsArray)
//                let feed = NewsInitialResponse(response: response)
//
//                completion(feed)
//            }
//        }
//    }
}
