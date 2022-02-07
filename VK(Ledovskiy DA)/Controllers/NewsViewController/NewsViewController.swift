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

            newsManager.get { feed in
                self.newsItemsPostArray = (feed?.response.items)!
                self.newsProfilesPostArray = (feed?.response.profiles)!
                self.newsGroupsPostArray = (feed?.response.groups)!
                print(self.newsItemsPostArray)
                print("-------------")
                print(self.newsProfilesPostArray)
            }

        tableView.delegate = self
        tableView.dataSource = self
    }
}
