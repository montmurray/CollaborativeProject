import SwiftUI

// Main view for displaying trivia questions
struct APIView: View {
    // state variables to store the trivia questions, answer state, and quiz progress
    @State private var questions = [TriviaQuestion]()  // list to store trivia questions
    var selectedCategory: String  // selected category for the trivia quiz
    
    @State private var currentQuestionIndex = 0  // index for the current question
    @State private var correctAnswers = 0  // counter for correct answers
    @State private var incorrectAnswers = 0  // counter for incorrect answers
    @State private var progress = 1  // tracking the current progress of the quiz
    @State private var finalGrade = 0  // the final grade after the quiz ends
    
    @State private var selectedAnswer: String?  // store the selected answer
    @State private var answer = ""  // temporary variable for user answer (not used in the current code)
    @State private var showAnswer = false  // whether the answer is displayed after selection
    @State private var isAnswerCorrect: Bool? = nil  // check if the selected answer is correct

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [AppColors.primary, AppColors.accent]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()  // makes the gradient fill the entire screen
                
            // display a large question mark as a background image
            Image(systemName: "questionmark")
                .font(.system(size: 550))
                .foregroundStyle(Color.white.opacity(0.1))
                
            VStack {
                // display the selected category (only before the answer is shown)
                ZStack {
                    if (showAnswer == false) {
                        Text("\(selectedCategory)")
                            .font(.system(size: 38))
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                            .foregroundColor(AppColors.secondaryUI)
                            .cornerRadius(15)
                            .shadow(radius: 20)
                    }
                }
                .padding()
                
                // display the question progress once the answer is shown
                if (showAnswer == true) {
                    if (progress < 21) {
                        Text("Question \(progress) of 20")
                            .font(.system(size: 38))
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                            .foregroundColor(AppColors.textPrimary)
                            .cornerRadius(15)
                            .shadow(radius: 1)
                            .padding()
                    }
                }

                // display counters for correct and incorrect answers
                HStack {
                    if (showAnswer == true) {
                        Text("Correct: \(correctAnswers)")
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                            .foregroundColor(AppColors.textPrimary)
                            .cornerRadius(15)
                            .shadow(radius: 1)
                        
                        Text("Incorrect: \(incorrectAnswers)")
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                            .foregroundColor(AppColors.textPrimary)
                            .cornerRadius(15)
                            .shadow(radius: 1)
                    }
                }
                
                // check if there are any questions loaded
                if !questions.isEmpty {
                    let question = questions[currentQuestionIndex]
                        
                    // display the question if the answer isn't shown yet
                    if (showAnswer == false) {
                        if (progress > 20) {
                            // show final grade and feedback based on the number of correct answers
                            if(correctAnswers > 0 && correctAnswers < 11)
                            {
                                Text("F")
                                    .font(.system(size: 60))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.secondaryUI)
                                    .cornerRadius(15)
                                    .shadow(radius: 1)
                                    .padding()
                                Text("Keep Trying!💔")
                                    .font(.system(size: 30))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.textPrimary)
                                    .cornerRadius(15)
                                    .shadow(radius: 1)
                                    .padding()
                            }
                            if(correctAnswers >= 12 && correctAnswers <= 13)
                            {
                                Text("D")
                                    .font(.system(size: 60))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.secondaryUI)
                                    .cornerRadius(15)
                                    .shadow(radius: 1)
                                    .padding()
                                Text("You can do better!💪")
                                    .font(.system(size: 30))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.textPrimary)
                                    .cornerRadius(15)
                                    .shadow(radius: 1)
                                    .padding()
                            }
                            if(correctAnswers >= 14 && correctAnswers <= 15)
                            {
                                Text("C")
                                    .font(.system(size: 60))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.secondaryUI)
                                    .cornerRadius(15)
                                    .shadow(radius: 1)
                                    .padding()
                                Text("Good Job!👍")
                                    .font(.system(size: 30))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.textPrimary)
                                    .cornerRadius(15)
                                    .shadow(radius: 1)
                                    .padding()
                            }
                            if(correctAnswers >= 16 && correctAnswers <= 17)
                            {
                                Text("B")
                                    .font(.system(size: 60))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.secondaryUI)
                                    .cornerRadius(15)
                                    .shadow(radius: 1)
                                    .padding()
                                Text("Great Job!🎉")
                                    .font(.system(size: 30))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.textPrimary)
                                    .cornerRadius(15)
                                    .shadow(radius: 1)
                                    .padding()
                            }
                            if(correctAnswers >= 18 && correctAnswers <= 19)
                            {
                                Text("A")
                                    .font(.system(size: 60))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.secondaryUI)
                                    .cornerRadius(15)
                                    .shadow(radius: 1)
                                    .padding()
                                Text("Amazing Job!🥳")
                                    .font(.system(size: 30))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.textPrimary)
                                    .cornerRadius(15)
                                    .shadow(radius: 1)
                                    .padding()
                            }
                            if(correctAnswers > 19 && correctAnswers <= 20)
                            {
                                Text("A+")
                                    .font(.system(size: 60))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.secondaryUI)
                                    .cornerRadius(15)
                                    .shadow(radius: 1)
                                    .padding()
                                Text("Amazing Job! You are a \(selectedCategory) wizard!🧙‍♂️")
                                    .font(.system(size: 30))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.textPrimary)
                                    .cornerRadius(15)
                                    .shadow(radius: 1)
                                    .padding()
                            }
                            // display corresponding feedback based on the score
                            // final grade categories for the user
                            // code to display grade is repeated for different ranges
                            
                            // show a button to navigate back to the main content view after finishing the quiz
                            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                                Text("Go Back!")
                                    .font(.title)
                                    .padding()
                                    .foregroundColor(AppColors.textPrimary)
                                    .background(LinearGradient(gradient: Gradient(colors: [AppColors.accent, AppColors.background]), startPoint: .top, endPoint: .bottom))
                                    .cornerRadius(12)
                                    .shadow(radius: 10)
                                    .scaleEffect(1.05)
                                    .animation(.easeOut, value: 1)
                            }
                        } else {
                            // display the current trivia question text
                            Text(question.question.text)
                                .font(.system(size: 20))
                                .multilineTextAlignment(.center)
                                .fontWeight(.bold)
                                .foregroundColor(AppColors.textPrimary)
                                .padding()
                                .cornerRadius(15)
                                .shadow(radius: 20)
                            
                            // shuffle the answers (correct + 3 incorrect answers)
                            let allAnswers = (question.incorrectAnswers + [question.correctAnswer]).shuffled()
                            
                            // display all the shuffled answers as buttons
                            ForEach(allAnswers, id: \.self) { answer in
                                Button(action: {
                                    selectedAnswer = answer  // set selected answer
                                    showAnswer = true  // show the answer
                                    isAnswerCorrect = answer == question.correctAnswer  // check if the selected answer is correct
                                    handleAnswer()  // update correct/incorrect counters
                                    
                                    // automatically move to the next question after a short delay
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        moveToNextQuestion()  // transition to the next question
                                    }
                                }) {
                                    Text(answer)  // show each possible answer
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
                    }
                    
                    // show feedback for whether the selected answer is correct or incorrect
                    if showAnswer {
                        Text(isAnswerCorrect == true ? "Correct!" : "Incorrect!")
                            .foregroundColor(isAnswerCorrect == true ? .green : .red)
                            .font(.system(size: 70))
                            .shadow(radius: 20)
                            .padding()
                    }
                } else {
                    // show a loading message while questions are being loaded
                    Text("Loading questions...")
                        .font(.title)
                        .padding()
                }
            }
            .onAppear {
                // load questions when the view appears based on the selected category
                Task {
                    questions = await loadQuestions(for: selectedCategory)
                }
            }
        }
    }
    
    // function to handle the logic when an answer is selected
    func handleAnswer() {
        if let isCorrect = isAnswerCorrect {
            if isCorrect {
                correctAnswers += 1  // increment correct answer counter
                progress += 1  // increment progress
            } else {
                incorrectAnswers += 1  // increment incorrect answer counter
                progress += 1  // increment progress
            }
        }
    }
    
    // function to move to the next question after answering
    func moveToNextQuestion() {
        selectedAnswer = nil  // reset selected answer
        showAnswer = false  // hide the current answer
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1  // move to the next question
        } else {
            currentQuestionIndex = 0  // reset or handle quiz completion
        }
    }
    
    // function to load trivia questions from a specific category
    func loadQuestions(for category: String) async -> [TriviaQuestion] {
        let formattedCategory = category.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let query = "https://the-trivia-api.com/v2/questions?categories=\(formattedCategory.lowercased())"
        
        guard let url = URL(string: query) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)  // fetch data from API
            let decodedResponse = try JSONDecoder().decode([TriviaQuestion].self, from: data)  // decode JSON response
            return decodedResponse  // return the decoded trivia questions
        } catch {
            print("Error")  // handle error if data fetch or decoding fails
            return []  // return an empty array if there's an error
        }
    }
}

// Trivia question and answer model
struct TriviaQuestion: Identifiable, Codable {
    let id = UUID()  // unique identifier for each question
    let question: QuestionText  // the question text
    let correctAnswer: String  // the correct answer
    let incorrectAnswers: [String]  // list of incorrect answers
    let category: String  // the category of the question
}

// structure to represent the text of the question
struct QuestionText: Codable {
    let text: String  // the actual question text
}

#Preview {
    APIView(selectedCategory: "General Knowledge")  // preview the API view with a sample category
}
