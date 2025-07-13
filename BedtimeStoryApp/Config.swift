import Foundation

struct APIConfig {
    // MARK: - Anthropic Claude API Configuration
    
    // Replace "your-anthropic-api-key-here" with your actual API key from console.anthropic.com
    static let anthropicAPIKey = "your-anthropic-api-key-here"
    
    // You can also use environment variables for better security:
    // static let anthropicAPIKey = ProcessInfo.processInfo.environment["ANTHROPIC_API_KEY"] ?? "your-anthropic-api-key-here"
    
    // MARK: - Cost Optimization Settings
    
    // Claude Haiku settings optimized for cost efficiency
    static let maxTokens = 200  // Limit story length to control costs
    static let timeoutInterval: TimeInterval = 30.0  // Request timeout
    
    // MARK: - API Endpoints
    
    static let anthropicBaseURL = "https://api.anthropic.com/v1/messages"
    static let anthropicVersion = "2023-06-01"
    
    // MARK: - Helper Methods
    
    static func isAPIKeyConfigured() -> Bool {
        return anthropicAPIKey != "your-anthropic-api-key-here" && !anthropicAPIKey.isEmpty
    }
    
    static func getAPIKey() -> String {
        return anthropicAPIKey
    }
}

// MARK: - Setup Instructions
/*
 
 🚀 SETUP INSTRUCTIONS:
 
 1. Get your Anthropic API key:
    - Go to https://console.anthropic.com
    - Create an account or sign in
    - Go to API Keys section
    - Create a new API key
 
 2. Add your API key:
    - Replace "your-anthropic-api-key-here" with your actual API key above
    - OR set an environment variable ANTHROPIC_API_KEY
 
 3. Cost Management:
    - Claude Haiku costs ~$0.25 per 1M input tokens, ~$1.25 per 1M output tokens
    - A typical bedtime story uses ~50-100 tokens, costing $0.0001-0.0002 per story
    - Monitor your usage at https://console.anthropic.com/usage
 
 4. Security Best Practices:
    - Never commit API keys to version control
    - Use environment variables in production
    - Implement rate limiting if needed
    - Monitor API usage regularly
 
 */