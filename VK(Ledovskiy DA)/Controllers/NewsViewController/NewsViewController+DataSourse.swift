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

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierAvatar) as! AvatarNameCell
            cell.configure(news: newsArray[indexPath.row])
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTextNews) as! TextNews
            cell.configure(text: newsArray[indexPath.row])
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierImageConetnt) as! ImageContentNews
            cell.configure(image: newsArray[indexPath.row])
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierLike) as! LikeCell
            cell.configure(like: newsArray[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
}

//        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierNews, for: indexPath)
//                as? NewsTableViewCell else {return UITableViewCell()}
//
//        cell.configure(news: newsArray[indexPath.row])
//
//        return cell
