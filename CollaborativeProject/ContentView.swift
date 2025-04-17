//
//  ContentView.swift
//  CollaborativeProject
//
//  Created by Tessa Murray on 4/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: APIView()) {
                    Text("Trivia List")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: APIView()) {
                    Text("Settings")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: APIView()) {
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
