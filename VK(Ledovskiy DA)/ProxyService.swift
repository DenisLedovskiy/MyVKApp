//
//  ProxyService.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 03.04.2022.
//

import Foundation

class ProxyNewsManager: NewsManagerProtocol {

    let newsManager: NewsManager

    init(newsManager: NewsManager) {
        self.newsManager = newsManager
    }

    func get(startTime: Int, startFrom: String, _ completion: @escaping ((NewsInitialResponse?), (String)) -> ()) {
        self.newsManager.get(startTime: startTime, startFrom: startFrom, completion)
        print("Загружены посты с \(startTime)")
    }
}
