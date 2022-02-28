//
//  NewsViewController+TableDelegate.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 31.10.2021.
//

import UIKit

extension NewsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        let postCellType = PostCellType(rawValue: indexPath.row)

        let height = newsItemsPostArray[indexPath.section].attachments[indexPath.section].photo.sizes[indexPath.section].height
        let widht = newsItemsPostArray[indexPath.section].attachments[indexPath.section].photo.sizes[indexPath.section].width
        
        let aspectRatio = CGFloat(height) / CGFloat(widht)
        
        switch postCellType {
        case .author:
            return UITableView.automaticDimension
        case .text:
            return UITableView.automaticDimension
        case .photo:
            let tableWidth = tableView.bounds.width
            let cellHeight = tableWidth * aspectRatio
            return cellHeight
        case .likeCount:
            return UITableView.automaticDimension
        default:
            return UITableView.automaticDimension
            
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: UIView = UIView.init(frame: CGRect.init(x: 0, y: 0,
                                                          width: self.view.bounds.size.width,
                                                          height: 4))
        view.backgroundColor = .gray

        return view
    }


    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
          guard let maxSection = indexPaths.map({ $0.section }).max() else { return }
          if maxSection > newsItemsPostArray.count - 3,
              !isLoading {
              isLoading = true

              newsManager.get(startTime: 1645994237,  startFrom: nextFrom) { [weak self] (news, nextFrom) in
                  guard let self = self else { return }
                  let indexSet = IndexSet(integersIn: self.newsItemsPostArray.count ..< self.newsItemsPostArray.count + news!.response.items.count)
                  self.newsItemsPostArray.append(contentsOf: news!.response.items)
                               self.tableView.insertSections(indexSet, with: .automatic)
                               self.isLoading = false
                           }
                       }
                   }
}
