//
//  APIVieww.swift
//  CollaborativeProject
//
//  Created by Tessa Murray on 4/21/25.
//


import SwiftUI

struct APIView: View {
    @State private var questions = [TriviaQuestion]()
    var selectedCategory: String
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: String?
    @State private var showAnswer = false

    var body: some View {
        VStack {
            // Category Selection (for demo, you can replace with your actual categories)
                        Text("Category: \(selectedCategory)")
                            .font(.title)
                            .padding()

                        // Show the question if available
                        if !questions.isEmpty {
                            let question = questions[currentQuestionIndex]

                            // Display the current question
                            Text(question.question.text)
                                .font(.headline)
                                .padding()
                // Shuffle answers (correct + 3 incorrect)
                let allAnswers = (question.incorrectAnswers + [question.correctAnswer]).shuffled()

                ForEach(allAnswers, id: \.self) { answer in
                    Button(action: {
                        selectedAnswer = answer
                        showAnswer = true
                    }) {
                        Text(answer)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(5)
                    }
                }

                // Show answer feedback
                if showAnswer {
                    Text(selectedAnswer == question.correctAnswer ? "Correct!" : "Incorrect!")
                        .font(.subheadline)
                        .foregroundColor(selectedAnswer == question.correctAnswer ? .green : .red)
                        .padding()

                    Button("Next") {
                        selectedAnswer = nil
                        showAnswer = false
                        if currentQuestionIndex < questions.count - 1 {
                            currentQuestionIndex += 1
                        } else {
                            currentQuestionIndex = 0 // Reset or handle quiz completion
                        }
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            } else {
                Text("Loading questions...")
                    .font(.title)
                    .padding()
            }
        }
        .onAppear {
            // Initial load for the selected category (if needed)
            Task {
                questions = await loadQuestions(for: selectedCategory)
            }
        }
    }

    // Function to load questions for the selected category
    func loadQuestions(for category: String) async -> [TriviaQuestion] {
        let formattedCategory = category.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let query = "https://the-trivia-api.com/v2/questions?categories=\(formattedCategory.lowercased())"
        
        guard let url = URL(string: query) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([TriviaQuestion].self, from: data)
            return decodedResponse
        } catch {
            print("Error")
            return []
        }
    }
}

// Trivia question and answer model
struct TriviaQuestion: Identifiable, Codable {
    let id = UUID()
    let question: QuestionText
    let correctAnswer: String
    let incorrectAnswers: [String]
    let category: String
}

struct QuestionText: Codable {
    let text: String
}

#Preview {
    APIView(selectedCategory: "General Knowledge")
}
