//
//  NewsViewController+DataSourse.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 31.10.2021.
//

import UIKit

extension NewsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = newsArray[indexPath.section]
        let postCellType = PostCellType(rawValue: indexPath.row)

        switch postCellType {
        case .author:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierAvatar) as! AvatarNameCell
            cell.configure(news: item)
            return cell
        case .text:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTextNews) as! TextNews
            cell.configure(text: item)
            return cell
        case .photo:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierImageConetnt) as! ImageContentNews
            cell.configure(image: item)
            return cell
        case .likeCount:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierLikes) as! LikesNews
            cell.configure(like: item)
            return cell
        default:
            return UITableViewCell()

        }

//        switch indexPath.row {
//        case 0:
//            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierAvatar) as! AvatarNameCell
//            cell.configure(news: newsArray[indexPath.section])
//            return cell
//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTextNews) as! TextNews
//            cell.configure(text: newsArray[indexPath.section])
//            return cell
//        case 2:
//            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierImageConetnt) as! ImageContentNews
//            cell.configure(image: newsArray[indexPath.section])
//            return cell
//        case 3:
//            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierLikes) as! LikesNews
//            cell.configure(like: newsArray[indexPath.section])
//            return cell
//        default:
//            return UITableViewCell()
//        }
    }
}
