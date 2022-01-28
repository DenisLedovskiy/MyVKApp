//
//  NewsViewController+TableDelegate.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 31.10.2021.
//

import UIKit

extension NewsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: UIView = UIView.init(frame: CGRect.init(x: 0, y: 0,
                                                          width: self.view.bounds.size.width,
                                                          height: 4))
        view.backgroundColor = .gray

        return view
    }


}
