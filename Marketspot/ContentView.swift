//
//  ContentView.swift
//  Marketspot
//
//  Created by Ahmad Shahir Abdul Satar on 9/26/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            AddItemView()
                .tabItem {
                    Image(systemName: "plus.app.fill")
                    Text("Add Item")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    ContentView()
}
