import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

struct AppColors {
    static let primary = Color(hex: "#00F5FF")      // Electric Cyan
    static let accent = Color(hex: "#FF007F")       // Hot Magenta
    static let background = Color(hex: "#0D0D0D")   // Midnight Black
    static let textPrimary = Color(hex: "#FFFFFF")  // White
    static let secondaryUI = Color(hex: "#FFD700")  // Solar Yellow
}


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
             ZStack {
                 LinearGradient(gradient: Gradient(colors: [AppColors.primary, AppColors.accent]), startPoint: .top, endPoint: .bottom)
                     .ignoresSafeArea()
                 
                 //Image (systemName: "question.mark")
                 //    .font(.system(size: 270))
                 //    .foregroundStyle(Color.white.opacity (0.4))
                 VStack(spacing: 20) {
                     
                     Text("The Answer Is!")
                         //.font(.largeTitle)
                         .font(.system(size: 70))
                         .multilineTextAlignment(.center)
                         .fontWeight(.bold)
                         .foregroundColor(AppColors.textPrimary)
                         .padding()
                         .cornerRadius(15)
                         .shadow(radius: 1)
                     
                     NavigationLink(destination: CategoryView()) {
                         Text("Trivia List")
                             .font(.title)
                             .padding()
                             .foregroundColor(AppColors.textPrimary)
                             .background(LinearGradient(gradient: Gradient(colors: [AppColors.accent, AppColors.background]), startPoint: .top, endPoint: .bottom))
                             .cornerRadius(12)
                             .shadow(radius: 10)
                             .scaleEffect(1.05)
                             .animation(.easeOut, value: 1)
                     }
                     
                     NavigationLink(destination: APIView(selectedCategory: "General Knowledge")) {
                         Text("Settings")
                             .font(.title)
                             .padding()
                             .foregroundColor(AppColors.textPrimary)
                             .background(LinearGradient(gradient: Gradient(colors: [AppColors.accent, AppColors.background]), startPoint: .top, endPoint: .bottom))
                             .cornerRadius(12)
                             .shadow(radius: 10)
                             .scaleEffect(1.05)
                             .animation(.easeOut, value: 1)
                     }
                     
                     // Test Navigation Button with Random Category
                     NavigationLink(destination: APIView(selectedCategory: categories.randomElement() ?? "General Knowledge")) {
                         Text("Test")
                             .font(.title)
                             .padding()
                             .foregroundColor(AppColors.textPrimary)
                             .background(LinearGradient(gradient: Gradient(colors: [AppColors.accent, AppColors.background]), startPoint: .top, endPoint: .bottom))
                             .cornerRadius(12)
                             .shadow(radius: 10)
                             .scaleEffect(1.05)
                             .animation(.easeOut, value: 1)
                     }
                     
                     Text("About").onTapGesture {
                         
                     }
                     .foregroundColor(AppColors.textPrimary)
                     
                     Text("About").onTapGesture {
                         
                     }
                     .foregroundColor(AppColors.textPrimary)
                 }
                 .padding()
             }
             .navigationBarTitleDisplayMode(.inline)
         }

     }
    /*
    
    var body: some View {
        NavigationView {
            ZStack {
                
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    Text("Welcome to The Answer Is!")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(15)
                        .shadow(radius: 10)
                    
                    NavigationLink(destination: CategoryView()) {
                        Text("Trivia List")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(12)
                            .shadow(radius: 10)
                            .scaleEffect(1.05)
                            .animation(.easeOut, value: 1)
                    }
                    
                    NavigationLink(destination: APIView(selectedCategory: "General Knowledge")) {
                        Text("Settings")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(12)
                            .shadow(radius: 10)
                            .scaleEffect(1.05)
                            .animation(.easeOut, value: 1)
                    }
                    
                    // Test Navigation Button with Random Category
                    NavigationLink(destination: APIView(selectedCategory: categories.randomElement() ?? "General Knowledge")) {
                        Text("Test")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(12)
                            .shadow(radius: 10)
                            .scaleEffect(1.05)
                            .animation(.easeOut, value: 1)
                    }

                }
            }
            .padding()
            .navigationTitle("")
            .edgesIgnoringSafeArea(.vertical)
            .edgesIgnoringSafeArea(.horizontal)
        }
    } */
}

#Preview {
    ContentView()
}

