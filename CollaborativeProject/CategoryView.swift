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

//initial struct
struct CategoryView: View {
    @State private var selectedCategory = "General Knowledge" // Default category
    
    //category list
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
        //interface
        //navigation views access the API
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [AppColors.primary, AppColors.accent]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                
                Image (systemName: "questionmark")
                    .font(.system(size: 550))
                    .foregroundStyle(Color.white.opacity (0.4))
                
                VStack(spacing: 20) {
                    
                    Text("Select A Category")
                        //.font(.largeTitle)
                        .font(.system(size: 30))
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.textPrimary)
                        .padding()
                        .cornerRadius(15)
                        .shadow(radius: 1)
                    

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
                            .background(AppColors.primary)
                            .cornerRadius(10)
                        }
                    }
                    
                    Spacer()
                
                        NavigationLink(destination: APIView(selectedCategory: selectedCategory)) {
                            Text("Start Trivia")
                                .font(.title)
                                .padding()
                                .foregroundColor(AppColors.textPrimary)
                                .background(LinearGradient(gradient: Gradient(colors: [AppColors.accent, AppColors.background]), startPoint: .top, endPoint: .bottom))
                                .cornerRadius(12)
                                .shadow(radius: 10)
                                .scaleEffect(1.05)
                                .animation(.easeOut, value: 1)
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CategoryView()
}
