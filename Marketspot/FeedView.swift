//
//  FeedView.swift
//  Marketspot
//
//  Created by Ahmad Shahir Abdul Satar on 9/27/24.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
    let price: String
}

struct FeedView: View {
    @State private var searchText = ""
    @State private var items: [Item] = [
        Item(image: "item1", title: "Vintage Chair", description: "Wooden chair, lightly used", price: "$50"),
        Item(image: "item2", title: "Laptop", description: "Gaming laptop, good condition", price: "$700"),
        Item(image: "item3", title: "Coffee Table", description: "Modern style, glass top", price: "$80")
    ]
    
    var filteredItems: [Item] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.title.contains(searchText) || $0.description.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Search bar
                HStack {
                    TextField("Search...", text: $searchText)
                        .padding(7)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal, 10)

                    Button(action: {
                        // Filter action
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }

                    Button(action: {
                        // Location action
                    }) {
                        Image(systemName: "location.circle")
                            .foregroundColor(.gray)
                    }
                }
                .padding()

                // Grid of items
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(filteredItems) { item in
                            VStack(alignment: .leading, spacing: 10) {
                                Image(item.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 120)
                                    .cornerRadius(10)
                                    .clipped()
                                
                                Text(item.title)
                                    .font(.headline)
                                
                                Text(item.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(2)
                                
                                Text(item.price)
                                    .font(.headline)
                                    .foregroundColor(.green)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(radius: 3)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Items for Sale")
            .background(Color(.systemGray6)) // Light background color for contrast
        }
    }
}
