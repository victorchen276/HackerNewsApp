//
//  ContentView.swift
//  HackerNewsApp
//
//  Created by Victor Chen on 29/10/19.
//  Copyright © 2019 Victor Chen. All rights reserved.
//

import SwiftUI

struct NewsListView: View {

    
    var apistring = HackerNewsAPI.TOPSTORIES
    
    var body: some View {
        
        NavigationView {
            List(){
                Text(apistring)
                Text("Hello World")
                Text("Hello World")
            }
            .navigationBarTitle(Text("News"))
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
