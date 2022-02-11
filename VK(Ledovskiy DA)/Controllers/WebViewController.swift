//
//  WebViewController.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 24.11.2021.
//


// 8008842

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    {
        didSet {
            webView.navigationDelegate = self
        }
    }

    let session = Session.instance

    let urlFriends = URL(string: "http://api.vk.com/method/friends.get?v=5.81&access_token=0c2ab0f1809272d69e35d8fb90c5948a3a6011c2f8cba76eaeeb03e93a2270d34834e81636505475330ee&count=5&fields=nickname,photo_50")

    func makeRequest() {
//        let task = URLSession.shared.dataTask(with: urlFriends!) { [weak self] data, response, error in
//            guard let data = data,
//                let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any?]
//            else {
//                print("Error")
//                return
//
//            }
//            self?.parseData(data: json)


        let task = URLSession.shared.dataTask(with: urlFriends!) { data, response, error in
            do {
                let friends = try JSONDecoder().decode(FriendsResponse.self, from: data!)
                let pars = friends.response?.items
//                print(pars.map { $0.firstName + " " + $0.lastName })
            } catch(let error) {
                print(error)
            }
    }
    task.resume()
}

//    func parseData(data: Any) {
//        let array = data as! [[String: Any]]
//        let users = array.map { FriendsResponse(json: $0) }
//        print(users)
//}




    override func viewDidLoad() {
        super.viewDidLoad()

        var urlComponents = URLComponents()
               urlComponents.scheme = "https"
               urlComponents.host = "oauth.vk.com"
               urlComponents.path = "/authorize"
               urlComponents.queryItems = [
                   URLQueryItem(name: "client_id", value: "8008842"),
                   URLQueryItem(name: "display", value: "mobile"),
                   URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                   URLQueryItem(name: "scope", value: "401502"),
                   URLQueryItem(name: "response_type", value: "token"),
                   URLQueryItem(name: "v", value: "5.68")
               ]

//        scope 262150 offline 401502    v 5.68

        let request = URLRequest(url: urlComponents.url!)

               webView.load(request)

    }
    }


extension WebViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
                   decisionHandler(.allow)
                   return
               }


               let params = fragment
                   .components(separatedBy: "&")
                   .map { $0.components(separatedBy: "=") }
                   .reduce([String: String]()) { result, param in
                       var dict = result
                       let key = param[0]
                       let value = param[1]
                       dict[key] = value
                       return dict
               }

        let token = params["access_token"]

        if token != nil { session.token = token! }
        else {return}

        print("Token: \(session.token)")

               decisionHandler(.cancel)

        let urlFriends = URL(string: "http://api.vk.com/method/friends.get?v=5.81&access_token=\(session.token)&count=10&fields=nickname&fields=photo_50")
        let urlPhoto = URL(string: "http://api.vk.com/method/photos.getAll?v=5.81&access_token=\(session.token)")
        let urlGroups = URL(string: "http://api.vk.com/method/groups.get?v=5.81&access_token=\(session.token)")
        let urlGroupsSearch = URL(string: "http://api.vk.com/method/groups.search?v=5.81&access_token=\(session.token)&q=music")

        let session = URLSession.shared

        guard urlFriends != nil else {
            print("Url not valid")
            return
        }

        guard urlPhoto != nil else {
            print("Url not valid")
            return
        }

        guard urlGroups != nil else {
            print("Url not valid")
            return
        }

        guard urlGroupsSearch != nil else {
            print("Url not valid")
            return
        }


        let taskFriends = session.dataTask(with: urlFriends!) { data, response, error in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.fragmentsAllowed)
            print("Friends: \(json)")
        }

            let taskPhoto = session.dataTask(with: urlPhoto!) { data, response, error in
                let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.fragmentsAllowed)
                print("Photo: \(json)")
            }

                let taskGroups = session.dataTask(with: urlGroups!) { data, response, error in
                    let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.fragmentsAllowed)
                    print("Groups: \(json)")
                }

                    let taskGroupsSearch = session.dataTask(with: urlGroupsSearch!) { data, response, error in
                        let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.fragmentsAllowed)
                        print("Search result: \(json)")
                    }


//                    taskFriends.resume()
//makeRequest()
//                    taskPhoto.resume()
//                    taskGroups.resume()
//                    taskGroupsSearch.resume()

    }

}


