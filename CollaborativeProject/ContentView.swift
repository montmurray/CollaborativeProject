//
//  ContentView.swift
//  CollaborativeProject
//
//  Created by Tessa Murray on 4/17/25.
//

import SwiftUI

// extension to allow creating color from a hex string (e.g., "#FF007F")
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)  // create a scanner to read the hex string
        _ = scanner.scanString("#")  // ignore the '#' character in the hex string
        var rgb: UInt64 = 0  // variable to store the rgb value
        scanner.scanHexInt64(&rgb)  // scan the hex value and store it in 'rgb'
        
        // extract the individual rgb components and normalize them to a range of 0 to 1
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        
        // initialize the color using the extracted rgb values
        self.init(red: r, green: g, blue: b)
    }
}

// define a struct to hold app colors using hex values
struct AppColors {
    static let primary = Color(hex: "#00F5FF")      // electric cyan
    static let accent = Color(hex: "#FF007F")       // hot magenta
    static let background = Color(hex: "#0D0D0D")   // midnight black
    static let textPrimary = Color(hex: "#FFFFFF")  // white
    static let secondaryUI = Color(hex: "#FFD700")  // solar yellow
}

struct ContentView: View {
    // state variable to track if the "about" section should be shown
    @State private var showingAbout = false
    
    // list of trivia categories
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
            ZStack {
                // background gradient using primary and accent colors
                LinearGradient(gradient: Gradient(colors: [AppColors.primary, AppColors.accent]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()  // makes the gradient fill the entire screen
                
                // background image - a large question mark with reduced opacity
                Image(systemName: "questionmark")
                    .font(.system(size: 650))
                    .foregroundStyle(Color.white.opacity(0.4))  // make the image transparent
                
                VStack(spacing: 20) {  // vertical stack with spacing between elements
                    
                    // title text with styling
                    Text("The Answer Is!")
                        .font(.system(size: 70))  // set the font size
                        .multilineTextAlignment(.center)  // center align the text
                        .fontWeight(.bold)  // make the text bold
                        .foregroundColor(AppColors.textPrimary)  // set the text color
                        .padding()  // add padding around the text
                        .cornerRadius(15)  // round the corners
                        .shadow(radius: 1)  // add a small shadow effect
                    
                    // navigationlink to the categoryview (for selecting trivia)
                    NavigationLink(destination: CategoryView().navigationBarBackButtonHidden(true)) {
                        Text("Pick your Trivia!")  // text displayed for the button
                            .font(.title)  // font size for the button
                            .padding()  // padding inside the button
                            .foregroundColor(AppColors.textPrimary)  // set text color
                            .background(LinearGradient(gradient: Gradient(colors: [AppColors.accent, AppColors.background]), startPoint: .top, endPoint: .bottom))  // button background gradient
                            .cornerRadius(12)  // rounded corners for the button
                            .shadow(radius: 10)  // shadow effect for the button
                            .scaleEffect(1.05)  // slightly scale the button up
                            .animation(.easeOut, value: 1)  // add animation to button press
                    }
                    
                    // "about" text, displayed when tapped
                    Text("About")
                        .onTapGesture {
                            showingAbout = true  // set the state to show the about alert when tapped
                        }
                        .font(.system(size: 20))  // font size for the "about" text
                        .multilineTextAlignment(.center)  // center the text
                        .fontWeight(.bold)  // make the text bold
                        .foregroundColor(AppColors.textPrimary)  // set text color
                        .padding()  // padding around the text
                        .cornerRadius(15)  // rounded corners for the text box
                        .shadow(radius: 1)  // shadow effect for the text box
                }
                
                // show an alert when the "about" text is tapped
                .alert(isPresented: $showingAbout) {
                    Alert(title: Text("Hello!"),
                          message: Text("Thank you for playing The Answer Is! \n\nHow to play: \nSimply tap 'Pick Your Trivia' and test your knowledge of over 6 topics including Arts and Literature, History, Science, Music, Society and Culture, and Geography!"),
                          dismissButton: .default(Text("OK")))  // button to dismiss the alert
                }
                
                .padding()  // padding around the entire vstack
            }
        }
    }
}

// preview for contentview
#Preview {
    ContentView()  // display the contentview in the preview
}
