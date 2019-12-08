//
//  News.swift
//  HackerNewsApp
//
//  Created by Chen Yue on 8/12/19.
//  Copyright © 2019 Victor Chen. All rights reserved.
//

import Foundation

struct News: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
