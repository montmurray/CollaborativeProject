import SwiftUI

struct APIView: View {
    //questions
@State private var questions = [TriviaQuestion]()
var selectedCategory: String
    //numbering questions
@State private var currentQuestionIndex = 0
@State private var correctAnswers = 0
@State private var incorrectAnswers = 0
@State private var progress = 0
    //answer
@State private var selectedAnswer: String?
@State private var answer = ""
    //correct answer
@State private var showAnswer = false
@State private var isAnswerCorrect: Bool? = nil
    
var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [AppColors.primary, AppColors.accent]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
            Image (systemName: "questionmark")
                .font(.system(size: 550))
                .foregroundStyle(Color.white.opacity(0.4))
                
            VStack {
                var progress = correctAnswers + incorrectAnswers
                Text("\(progress) / 20")
                    .font(.system(size: 40))
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.textPrimary)
                    .cornerRadius(15)
                    .shadow(radius: 1)
                
                Text("\(selectedCategory)")
                    .font(.system(size: 40))
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.textPrimary)
                    .cornerRadius(15)
                    .shadow(radius: 1)
                    
                HStack {
                    Text("Correct: \(correctAnswers)")
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.textPrimary)
                        .cornerRadius(15)
                        .shadow(radius: 1)
                        
                    Text("Incorrect: \(incorrectAnswers)")
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.textPrimary)
                        .cornerRadius(15)
                        .shadow(radius: 1)
                }
                    
                if !questions.isEmpty {
                    let question = questions[currentQuestionIndex]
                        
                    if (showAnswer == false)
                    {
                        // Display the current question
                    Text(question.question.text)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.textPrimary)
                        .padding()
                        .cornerRadius(15)
                        .shadow(radius: 1)
                        
                        // Shuffle answers (correct + 3 incorrect)
                        let allAnswers = (question.incorrectAnswers + [question.correctAnswer]).shuffled()
                        
                        
                            ForEach(allAnswers, id: \.self) { answer in
                                Button(action: {
                                    selectedAnswer = answer
                                    showAnswer = true
                                    isAnswerCorrect = answer == question.correctAnswer
                                    handleAnswer()
                                    
                                    // Automatically transition to the next question after a short delay
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        moveToNextQuestion()
                                    }
                                }) {
                                    Text(answer)
                                        .font(.system(size: 20))
                                        .padding()
                                        .foregroundColor(AppColors.textPrimary)
                                        .background(LinearGradient(gradient: Gradient(colors: [AppColors.accent, AppColors.background]), startPoint: .top, endPoint: .bottom))
                                        .cornerRadius(12)
                                        .shadow(radius: 10)
                                        .scaleEffect(1.05)
                                        .animation(.easeOut, value: 1)
                                        .padding()
                                }
                            }
                        }
                        // Show answer feedback
                        if showAnswer {
                            Text(isAnswerCorrect == true ? "Correct!" : "Incorrect!")
                                .foregroundColor(isAnswerCorrect == true ? .green : .red)
                                .font(.system(size: 70))
                                .shadow(radius: 20)
                                .padding()
                        }
                    } else {
                        Text("Loading questions...")
                            .font(.title)
                            .padding()
                    }
                }
                .onAppear {
                    // Initial load for the selected category
                    Task {
                        questions = await loadQuestions(for: selectedCategory)
                    }
                }
            }
        }
        
        // Handle answering logic, including updating correct/incorrect counters
        func handleAnswer() {
            if let isCorrect = isAnswerCorrect {
                if isCorrect {
                    correctAnswers += 1
                } else {
                    incorrectAnswers += 1
                }
            }
        }
        
        // Move to the next question
        func moveToNextQuestion() {
            selectedAnswer = nil
            showAnswer = false
            if currentQuestionIndex < questions.count - 1 {
                currentQuestionIndex += 1
            } else {
                currentQuestionIndex = 0 // Reset or handle quiz completion
            }
        }
        
        // Loads questions from selected category
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

