
//
//  ContentView.swift
//  CollaborativeProject
//
//  Created by Tessa Murray on 4/14/25.
//

import SwiftUI

struct APIView: View {
    //placeholder
    @State private var questions = [String]()
    var body: some View {
        NavigationView {
            List(questions, id:\.self) { question in
                NavigationLink(destination: Text(question)) {
                    Text(question)
                }
            }
            .navigationTitle("Trivia List")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await getQuestions()
        }
    }
    //placeholder
    func getQuestions() async {
        let query = "https://the-trivia-api.com/v2/questions/"
        guard let url = URL(string: query) else { return }
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([TriviaQuestion].self, from: data)
            questions = decodedResponse.map { $0.question.text }
        } catch {
            print("Error")
        }
    }
}

#Preview {
    APIView()
}

//placeholder, update when we determine question categories.
struct TriviaQuestion: Codable {
    let question: QuestionText
}

struct QuestionText: Codable {
    let text: String
}
