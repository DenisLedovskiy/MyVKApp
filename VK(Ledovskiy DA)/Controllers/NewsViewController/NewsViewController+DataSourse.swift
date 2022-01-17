//
//  NewsViewController+DataSourse.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 31.10.2021.
//

import UIKit

extension NewsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierNews, for: indexPath)
                as? NewsTableViewCell else {return UITableViewCell()}

        cell.configure(news: newsArray[indexPath.row])

        return cell
    }
}
