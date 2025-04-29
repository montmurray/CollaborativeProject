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
    @State private var showingAbout = false
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
                
                Image (systemName: "questionmark")
                    .font(.system(size: 650))
                    .foregroundStyle(Color.white.opacity (0.4))
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
                        Text("Pick your Trivia!")
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
                        showingAbout = true
                    }
                    //.font(.largeTitle)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.textPrimary)
                    .padding()
                    .cornerRadius(15)
                    .shadow(radius: 1)
                }
                
                .alert(isPresented: $showingAbout) {
                    Alert(title: Text("Hello!"),
                          message: Text("Thank you for playing The Answer Is! \n\nHow to play: \nSimply tap 'Pick Your Trivia' and test your knowledge of over 6 topics including Arts and Literature, History, Science, Music, Society and Culture, and Geography!"),
                          dismissButton: .default(Text("OK")))
                }
                
                .padding()
            }
        }
    }
    
}

#Preview {
    ContentView()
}

