import Foundation

class StoryGenerator: ObservableObject {
    
    private let apiKey = APIConfig.getAPIKey()
    private let baseURL = APIConfig.anthropicBaseURL
    
    // Story templates for different emoji combinations
    private let emojiMeanings: [String: String] = [
        "🌙": "moon",
        "⭐": "star",
        "🦄": "unicorn",
        "🐻": "bear",
        "🌸": "flower",
        "🏰": "castle",
        "🚂": "train",
        "🐰": "bunny",
        "🌊": "ocean",
        "🔥": "fire",
        "🌳": "tree",
        "🦋": "butterfly",
        "🎈": "balloon",
        "🍎": "apple",
        "🐸": "frog",
        "🌈": "rainbow",
        "☁️": "cloud",
        "🕊️": "dove",
        "🦔": "hedgehog",
        "🌻": "sunflower"
    ]
    
    struct ClaudeRequest: Codable {
        let model: String
        let max_tokens: Int
        let messages: [Message]
        let system: String?
        
        struct Message: Codable {
            let role: String
            let content: String
        }
    }
    
    struct ClaudeResponse: Codable {
        let content: [Content]
        let usage: Usage?
        
        struct Content: Codable {
            let text: String
            let type: String
        }
        
        struct Usage: Codable {
            let input_tokens: Int
            let output_tokens: Int
        }
    }
    
    struct StoryGenerationError: Error, LocalizedError {
        let message: String
        
        var errorDescription: String? {
            return message
        }
    }
    
    func generateStory(from emojis: [String]) async throws -> String {
        if emojis.isEmpty {
            return "Select some emojis to create your bedtime story!"
        }
        
        // Check if API key is configured
        guard APIConfig.isAPIKeyConfigured() else {
            throw StoryGenerationError(message: "API key not configured. Please add your Anthropic API key in Config.swift")
        }
        
        // Convert emojis to words
        let characters = emojis.compactMap { emoji in
            emojiMeanings[emoji]
        }
        
        if characters.isEmpty {
            return "Please select some story characters to create your bedtime story!"
        }
        
        let charactersText = characters.joined(separator: ", ")
        
        let systemPrompt = """
        You are a creative storyteller who writes gentle, age-appropriate bedtime stories for children aged 1-6 years old. 
        
        Guidelines:
        - Stories should be 3-5 sentences long
        - Use simple, positive language
        - Include themes of friendship, kindness, and helping others
        - Always end with a peaceful, sleepy conclusion
        - Make the story magical and comforting
        - Avoid scary or sad elements
        - Include the specified characters naturally in the story
        """
        
        let userPrompt = """
        Create a gentle bedtime story featuring these characters: \(charactersText)
        
        Make it magical, comforting, and perfect for helping a young child fall asleep peacefully.
        """
        
        let requestBody = ClaudeRequest(
            model: "claude-3-haiku-20240307",
            max_tokens: APIConfig.maxTokens,
            messages: [
                ClaudeRequest.Message(role: "user", content: userPrompt)
            ],
            system: systemPrompt
        )
        
        guard let url = URL(string: baseURL) else {
            throw StoryGenerationError(message: "Invalid API URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(APIConfig.anthropicVersion, forHTTPHeaderField: "anthropic-version")
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.timeoutInterval = APIConfig.timeoutInterval
        
        do {
            let jsonData = try JSONEncoder().encode(requestBody)
            request.httpBody = jsonData
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw StoryGenerationError(message: "Invalid response")
            }
            
            if httpResponse.statusCode != 200 {
                let errorMessage = String(data: data, encoding: .utf8) ?? "Unknown error"
                throw StoryGenerationError(message: "API Error (\(httpResponse.statusCode)): \(errorMessage)")
            }
            
            let claudeResponse = try JSONDecoder().decode(ClaudeResponse.self, from: data)
            
            guard let firstContent = claudeResponse.content.first else {
                throw StoryGenerationError(message: "No content in response")
            }
            
            return firstContent.text.trimmingCharacters(in: .whitespacesAndNewlines)
            
        } catch let error as StoryGenerationError {
            throw error
        } catch {
            throw StoryGenerationError(message: "Network error: \(error.localizedDescription)")
        }
    }
    
    // Fallback story generator for when API is not available
    func generateFallbackStory(from emojis: [String]) -> String {
        let characters = emojis.compactMap { emoji in
            emojiMeanings[emoji]
        }
        
        if characters.isEmpty {
            return "Please select some emojis to create your bedtime story!"
        }
        
        let fallbackOpenings = [
            "Once upon a time, in a magical land far away",
            "Long ago, when the world was young and full of wonder",
            "In a cozy little village where dreams come true"
        ]
        
        let fallbackEndings = [
            "And they all lived happily ever after, sleeping soundly under the starry sky. The end. 🌙✨",
            "As the moon rose high, everyone fell into the most peaceful dreams. Sweet dreams! 💤",
            "They curled up together, safe and warm, and drifted off to wonderful dreams. Goodnight! 🌟"
        ]
        
        let opening = fallbackOpenings.randomElement() ?? fallbackOpenings[0]
        let ending = fallbackEndings.randomElement() ?? fallbackEndings[0]
        
        if characters.count == 1 {
            return "\(opening), there lived a wonderful \(characters[0]) who brought joy and happiness to everyone around. This magical friend had many adventures and always helped others. \(ending)"
        } else {
            let primary = characters[0]
            let secondary = characters[1]
            return "\(opening), lived a kind \(primary) and a gentle \(secondary) who were the best of friends. Together, they went on magical adventures, always helping others and spreading joy wherever they went. \(ending)"
        }
    }
}