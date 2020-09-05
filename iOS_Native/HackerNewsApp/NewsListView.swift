//
//  ContentView.swift
//  HackerNewsApp
//
//  Created by Victor Chen on 29/10/19.
//  Copyright © 2019 Victor Chen. All rights reserved.
//

import SwiftUI

struct NewsListView: View {
    @ObservedObject var viewModel = NewsListViewModel()
    var body: some View {
        List(viewModel.posts) { post in
            Text(post.title)
            
            
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
