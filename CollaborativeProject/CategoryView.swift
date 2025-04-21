//
//  CategoryView.swift
//  CollaborativeProject
//
//  Created by Tessa Murray on 4/21/25.
//


//
//  CategoryView.swift
//  CollaborativeAPI
//
//  Created by Tessa Murray on 4/17/25.
//

import SwiftUI

struct CategoryView: View {
    @State private var selectedCategory = "General Knowledge" // Default category
    
    let categories = [
        "General Knowledge",
        "Arts and Literature",
        "History",
        "Science",
        "Music",
        "Society and Culture",
        "Geography"
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Select a Category")
                    .font(.title)
                    .padding()

                // Display a list of categories
                List(categories, id: \.self) { category in
                    Button(action: {
                        // When a category is selected, update the selectedCategory
                        selectedCategory = category
                    }) {
                        HStack {
                            Text(category)
                                .font(.title2)
                            Spacer()
                            if selectedCategory == category {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                }
                NavigationLink(destination: APIView(selectedCategory: selectedCategory)) {
                    Text("Start Trivia")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.top)
                }
            }
            .navigationTitle("Category Selection")
        }
    }
}

#Preview {
    CategoryView()
}
