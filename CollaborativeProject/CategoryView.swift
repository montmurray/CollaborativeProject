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

// define the main view for selecting a trivia category
struct CategoryView: View {
    // state variable to track the currently selected category
    @State private var selectedCategory = "General Knowledge" // default category
    
    // list of available trivia categories
    let categories = [
        "General Knowledge🤔",
        "Arts and Literature🖼️",
        "History⏳",
        "Science🧪",
        "Music🎵",
        "Society and Culture🇺🇸",
        "Geography🌎"
    ]
    
    var body: some View {
        // navigationview is used for pushing views with navigation
        NavigationView {
            ZStack {
                // apply a gradient background to the entire view
                LinearGradient(gradient: Gradient(colors: [AppColors.primary, AppColors.accent]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()  // ensures the gradient fills the entire screen
                
                // vertical stack for arranging content vertically
                VStack(spacing: 20) {
                    
                    // title label for selecting a category
                    Text("Select A Category")
                        .font(.system(size: 30))  // set font size
                        .multilineTextAlignment(.center)  // center-align the text
                        .fontWeight(.bold)  // make the text bold
                        .foregroundColor(AppColors.secondaryUI)  // set the text color
                        .padding()  // add padding around the text
                        .cornerRadius(15)  // round the corners of the text box
                        .shadow(radius: 15)  // add a shadow effect around the text box
                    
                    // list displaying all available categories
                    List(categories, id: \.self) { category in
                        Button(action: {
                            // when a category is selected, update the selectedCategory state variable
                            selectedCategory = category
                        })
                        {
                            // horizontal stack to display category and checkmark (if selected)
                            HStack {
                                Text(category)  // display the category name
                                    .font(.title2)  // set the font size
                                    
                                Spacer()  // spacer to push the checkmark to the right
                                
                                // if this category is selected, show a checkmark icon
                                if selectedCategory == category {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)  // set checkmark color to blue
                                }
                            }
                            .padding()  // add padding inside each list item
                            .background(AppColors.primary)  // set background color of the list item
                            .cornerRadius(10)  // round the corners of the list item
                        }
                    }
                    .cornerRadius(15)  // round the corners of the entire list
                    
                    Spacer()  // add space between the category list and the "Start Trivia" button
                
                    // navigationlink to start the trivia game, passing the selected category
                    NavigationLink(destination: APIView(selectedCategory: selectedCategory)) {
                        Text("Start Trivia")  // text for the "Start Trivia" button
                            .font(.title)  // set font size for the button text
                            .padding()  // add padding inside the button
                            .foregroundColor(AppColors.textPrimary)  // set the button text color
                            .background(LinearGradient(gradient: Gradient(colors: [AppColors.accent, AppColors.background]), startPoint: .top, endPoint: .bottom))  // set gradient background for the button
                            .cornerRadius(12)  // round the corners of the button
                            .shadow(radius: 10)  // add shadow effect around the button
                            .scaleEffect(1.05)  // slightly scale the button up for a "press" effect
                            .animation(.easeOut, value: 1)  // add animation to the button for smooth interaction
                    }
                }
                .padding()  // add padding around the entire vstack
            }
            .navigationBarTitleDisplayMode(.inline)  // set the navigation bar title display to inline (smaller title)
        }
    }
}

// preview for categoryview to view it in the swiftui canvas
#Preview {
    CategoryView()  // display the categoryview in the preview
}
