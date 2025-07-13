# 🌙 Bedtime Stories App

A delightful SwiftUI iOS app that generates personalized bedtime stories for children aged 1-6 years old using drag-and-drop emojis. Powered by **Anthropic Claude Haiku** for cost-efficient, high-quality story generation.

## ✨ Features

- **AI-Powered Stories**: Uses Anthropic Claude Haiku for creative, age-appropriate story generation
- **Drag & Drop Interface**: Kids can easily drag emojis to create their story elements
- **Cost-Efficient**: Claude Haiku provides excellent stories at ~$0.0001-0.0002 per story
- **Beautiful UI**: Child-friendly design with colorful gradients and smooth animations
- **Real-Time Generation**: Stories are generated instantly based on selected emojis
- **Variety of Characters**: 20 different emojis including animals, nature, and magical elements
- **Offline Fallback**: Works offline with pre-programmed stories when API is unavailable
- **Friendship & Kindness Themes**: All stories focus on positive values like friendship, kindness, and helping others

## 🎨 How It Works

1. **Select Emojis**: Children drag their favorite emojis from the grid into the story canvas
2. **Create Story**: Tap the "Create Story" button to generate a unique bedtime story
3. **Read Together**: The generated story appears in a beautiful, easy-to-read format
4. **Start Over**: Clear the canvas and create new stories with different emoji combinations

## 📱 Available Emojis

The app includes 20 carefully selected emojis perfect for bedtime stories:

🌙 Moon • ⭐ Star • 🦄 Unicorn • 🐻 Bear • 🌸 Flower • 🏰 Castle • 🚂 Train • 🐰 Bunny • 🌊 Ocean • 🔥 Fire • 🌳 Tree • 🦋 Butterfly • 🎈 Balloon • 🍎 Apple • 🐸 Frog • 🌈 Rainbow • ☁️ Cloud • 🕊️ Dove • 🦔 Hedgehog • 🌻 Sunflower

## 🏗️ Project Structure

```
BedtimeStoryApp/
├── BedtimeStoryApp.swift          # Main app entry point
├── ContentView.swift              # Main UI with drag-and-drop functionality
├── StoryGenerator.swift           # AI story generation with Claude Haiku
├── Config.swift                   # API configuration and settings
├── Info.plist                     # App configuration
├── Assets.xcassets/               # App icons and colors
└── Preview Content/               # Preview assets for development
```

## 🚀 Getting Started

### Prerequisites
- Xcode 15.0 or later
- iOS 17.0 or later
- Swift 5.0
- Anthropic API account (for AI story generation)

### API Setup
1. **Get your Anthropic API key**:
   - Go to [console.anthropic.com](https://console.anthropic.com)
   - Create an account or sign in
   - Navigate to API Keys section
   - Create a new API key

2. **Configure the app**:
   - Open `BedtimeStoryApp/Config.swift`
   - Replace `"your-anthropic-api-key-here"` with your actual API key
   - Save the file

### Installation
1. Clone the repository
2. Open `BedtimeStoryApp.xcodeproj` in Xcode
3. Configure your API key (see API Setup above)
4. Select your target device or simulator
5. Build and run the app

### Cost Information
- **Claude Haiku Pricing**: ~$0.25/1M input tokens, ~$1.25/1M output tokens
- **Per Story Cost**: ~$0.0001-0.0002 (extremely cost-efficient)
- **Monthly Usage**: 1000 stories ≈ $0.10-0.20
- **Monitor Usage**: Track consumption at [console.anthropic.com/usage](https://console.anthropic.com/usage)

### Usage
1. Launch the app
2. Drag emojis from the bottom grid to the "Your Story Elements" area
3. Tap "Create Story" to generate a bedtime story
4. Read the story together with your child
5. Use "Clear" to start over with new emoji combinations

## 🎭 Story Examples

### Single Character Stories
- **🌙 Moon**: "Once upon a time, there lived a gentle moon who watched over all the sleeping children..."
- **🦄 Unicorn**: "In a magical land far away, lived a friendly unicorn with a rainbow mane..."
- **🐻 Bear**: "Long ago, there was a cuddly bear who loved to tell stories..."

### Multi-Character Adventures
- **🌙 + ⭐**: Stories about friendship between the moon and stars
- **🦄 + 🐻**: Adventures of a unicorn and bear helping forest friends
- **🌸 + 🦋**: Tales of flowers and butterflies creating magical gardens

## 🎯 Educational Benefits

- **Creativity**: Encourages children to experiment with different story combinations
- **Language Development**: Exposure to varied vocabulary and story structures
- **Emotional Learning**: Stories emphasize positive emotions and social values
- **Fine Motor Skills**: Drag-and-drop interaction helps develop coordination
- **Bedtime Routine**: Creates a calming, consistent bedtime activity

## 🛠️ Technical Features

- **SwiftUI**: Modern, declarative UI framework
- **Drag and Drop**: Native iOS drag-and-drop API implementation
- **AI Integration**: Anthropic Claude Haiku API for creative story generation
- **Async/Await**: Modern Swift concurrency for smooth API calls
- **Error Handling**: Comprehensive error handling with fallback options
- **Offline Support**: Works without internet using pre-programmed stories
- **Cost Optimization**: Efficient token usage and request management
- **Responsive Design**: Works on both iPhone and iPad
- **Smooth Animations**: Delightful transitions and loading states

## 🌟 Future Enhancements

- **AI Improvements**: 
  - Character consistency across stories
  - Story length customization
  - Personalized story themes
- **Features**:
  - Voice narration for generated stories
  - Save favorite stories feature
  - More emoji characters and themes
  - Custom emoji upload
  - Story sharing with family
- **Technical**:
  - Multiple language support
  - Dark mode optimization
  - Local story caching
  - Usage analytics and cost tracking
  - Alternative LLM providers (OpenAI, Gemini)

## 📄 License

This project is created for educational and personal use. Feel free to modify and adapt it for your needs.

## 🔒 Security & Privacy

- **API Keys**: Never commit API keys to version control
- **Environment Variables**: Use environment variables for production deployments
- **Data Privacy**: Stories are generated in real-time and not stored by the app
- **Anthropic Privacy**: Review [Anthropic's privacy policy](https://www.anthropic.com/privacy) for API usage

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues or pull requests to improve the app.

### Contributing Guidelines
- Test all changes with actual API calls
- Update cost estimates if token usage changes
- Add fallback handling for new features
- Follow SwiftUI best practices

---

*Made with ❤️ for bedtime stories and sweet dreams* 🌙✨  
*Powered by Anthropic Claude Haiku for cost-efficient AI storytelling*