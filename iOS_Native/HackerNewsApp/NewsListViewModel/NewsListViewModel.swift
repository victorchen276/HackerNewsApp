//
//  NewsListViewModel.swift
//  HackerNewsApp
//
//  Created by Chen Yue on 8/12/19.
//  Copyright © 2019 Victor Chen. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class NewsListViewModel: ObservableObject{
    

    
    let objectWillChange = ObservableObjectPublisher()
    
    var posts = [News](){
        didSet {
            self.objectWillChange.send()
        }
    }
    
    init() {
        print("send request")
        fetchPosts()
    }
    
    private func fetchPosts() {
        Webservice().getAllPosts{
//            print($0)
            self.posts = $0
            print(self.posts)
        }
    }
}
