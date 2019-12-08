//
//  Webservice.swift
//  HackerNewsApp
//
//  Created by Chen Yue on 8/12/19.
//  Copyright © 2019 Victor Chen. All rights reserved.
//

import Foundation

class Webservice {
    func getAllPosts(completion: @escaping ([News]) -> ()) {
        let apistring = HackerNewsAPI.TOPSTORIES
//        guard let url = URL(string:"https://jsonplaceholder.typicode.com/posts") else {
        guard let url = URL(string:apistring) else {
                fatalError("URL is not correct!")
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let recvData = data else{
                fatalError("no data recv!")
            }
            let jsonObject : Any = try! JSONSerialization.jsonObject(with: recvData, options: [])
            print(jsonObject)
            for data in jsonObject as! [Int] {
                print(data)
            }
//            let jsonArray = jsonObject as NSArray
//            print(jsonArray)
//            let newsIdArray = try! JSONSerialization.jsonObject(with: recvData, options: JSONSerialization.ReadingOptions()) as? [Any]
//            print(newsIdArray)
            
//            let posts = try! JSONDecoder().decode([News].self, from:data!)
//            DispatchQueue.main.async {
//                 completion(posts)
//            }
        }.resume()
    }
}
