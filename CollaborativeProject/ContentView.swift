//
//  ContentView.swift
//  CollaborativeProject
//
//  Created by Devan Myers on 4/14/25.
//

import SwiftUI

struct ContentView: View {
    
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
                NavigationLink(destination: CategoryView()) {
                    Text("Trivia List")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: APIView(selectedCategory: "General Knowledge")) {
                    Text("Settings")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: APIView(selectedCategory: categories.randomElement() ?? "General Knowledge")) {
                    Text("Test")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                .navigationTitle("The Answer IS...")
            }
        }
    }
}

#Preview {
    ContentView()
}

