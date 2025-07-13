import SwiftUI

struct ContentView: View {
    @State private var storyEmojis: [String] = []
    @State private var generatedStory: String = ""
    @State private var showStory = false
    @State private var isGenerating = false
    
    let availableEmojis = ["🌙", "⭐", "🦄", "🐻", "🌸", "🏰", "🚂", "🐰", "🌊", "🔥", "🌳", "🦋", "🎈", "🍎", "🐸", "🌈", "☁️", "🕊️", "🦔", "🌻"]
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.3), Color.blue.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Title
                Text("✨ Bedtime Stories ✨")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                Text("Drag emojis to create your story!")
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.8))
                
                // Story canvas
                VStack {
                    Text("Your Story Elements:")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(storyEmojis, id: \.self) { emoji in
                                Text(emoji)
                                    .font(.system(size: 40))
                                    .padding(10)
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(Circle())
                                    .shadow(radius: 2)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 80)
                    .background(Color.white.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .padding(.horizontal)
                .dropDestination(for: String.self) { items, location in
                    for item in items {
                        if !storyEmojis.contains(item) {
                            storyEmojis.append(item)
                        }
                    }
                    return true
                }
                
                // Available emojis
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 15) {
                    ForEach(availableEmojis, id: \.self) { emoji in
                        Text(emoji)
                            .font(.system(size: 30))
                            .padding(10)
                            .background(Color.white.opacity(0.8))
                            .clipShape(Circle())
                            .shadow(radius: 2)
                            .draggable(emoji)
                    }
                }
                .padding(.horizontal)
                
                // Action buttons
                HStack(spacing: 20) {
                    Button(action: {
                        storyEmojis.removeAll()
                        generatedStory = ""
                        showStory = false
                    }) {
                        Text("Clear")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red.opacity(0.7))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Button(action: generateStory) {
                        HStack {
                            if isGenerating {
                                ProgressView()
                                    .scaleEffect(0.8)
                                    .tint(.white)
                            }
                            Text(isGenerating ? "Creating..." : "Create Story")
                                .font(.headline)
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(storyEmojis.isEmpty ? Color.gray : Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .disabled(storyEmojis.isEmpty || isGenerating)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .sheet(isPresented: $showStory) {
            StoryView(story: generatedStory, emojis: storyEmojis)
        }
    }
    
    private func generateStory() {
        isGenerating = true
        
        // Simulate story generation delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let storyGenerator = StoryGenerator()
            generatedStory = storyGenerator.generateStory(from: storyEmojis)
            isGenerating = false
            showStory = true
        }
    }
}

struct StoryView: View {
    let story: String
    let emojis: [String]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                gradient: Gradient(colors: [Color.indigo.opacity(0.2), Color.purple.opacity(0.2)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Header
                HStack {
                    Button("Done") {
                        dismiss()
                    }
                    .font(.headline)
                    .foregroundColor(.blue)
                    
                    Spacer()
                    
                    Text("📖 Your Bedtime Story")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    // Placeholder for symmetry
                    Button("Done") {
                        dismiss()
                    }
                    .font(.headline)
                    .foregroundColor(.blue)
                    .opacity(0)
                }
                .padding()
                
                // Story emojis
                HStack(spacing: 8) {
                    ForEach(emojis, id: \.self) { emoji in
                        Text(emoji)
                            .font(.system(size: 25))
                    }
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                // Story text
                ScrollView {
                    Text(story)
                        .font(.title3)
                        .lineSpacing(8)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 2)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}