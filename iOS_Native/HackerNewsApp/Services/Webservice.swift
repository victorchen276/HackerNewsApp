//
//  Webservice.swift
//  HackerNewsApp
//
//  Created by Chen Yue on 8/12/19.
//  Copyright © 2019 Victor Chen. All rights reserved.
//

import Foundation

public class Webservice {
    func getAllPosts(completion: @escaping ([News]) -> ()) {
        let apistring = HackerNewsAPI.TOPSTORIES
        guard let url = URL(string:apistring) else {
                fatalError("URL is not correct!")
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
//            guard let recvData = data else{
//                fatalError("no data recv!")
//            }
//            let jsonObject : Any = try! JSONSerialization.jsonObject(with: recvData, options: [])
//            print(jsonObject)
//            for data in jsonObject as! [Int] {
//                print(data)
//            }
        }.resume()
    }
}
