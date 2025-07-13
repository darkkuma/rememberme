import Foundation

class StoryGenerator {
    
    // Story templates for different emoji combinations
    private let storyTemplates: [String: String] = [
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
    
    private let openings = [
        "Once upon a time, in a magical land far away",
        "Long ago, when the world was young and full of wonder",
        "In a cozy little village where dreams come true",
        "On a peaceful evening when the stars began to twinkle",
        "In an enchanted forest where magic happens every day"
    ]
    
    private let endings = [
        "And they all lived happily ever after, sleeping soundly under the starry sky. The end. 🌙✨",
        "As the moon rose high, everyone fell into the most peaceful dreams. Sweet dreams! 💤",
        "They curled up together, safe and warm, and drifted off to wonderful dreams. Goodnight! 🌟",
        "With hearts full of joy and love, they slept peacefully through the night. The end. 💕",
        "And so, with smiles on their faces, they had the most magical dreams until morning came. 🌅"
    ]
    
    func generateStory(from emojis: [String]) -> String {
        if emojis.isEmpty {
            return "Select some emojis to create your bedtime story!"
        }
        
        // Convert emojis to words
        let characters = emojis.compactMap { emoji in
            storyTemplates[emoji]
        }
        
        // Select random opening
        let opening = openings.randomElement() ?? openings[0]
        
        // Generate story based on characters
        let story = createStoryNarrative(characters: characters)
        
        // Select random ending
        let ending = endings.randomElement() ?? endings[0]
        
        return "\(opening), \(story) \(ending)"
    }
    
    private func createStoryNarrative(characters: [String]) -> String {
        if characters.isEmpty {
            return "there was a wonderful place where anything was possible."
        }
        
        if characters.count == 1 {
            return createSingleCharacterStory(character: characters[0])
        } else {
            return createMultiCharacterStory(characters: characters)
        }
    }
    
    private func createSingleCharacterStory(character: String) -> String {
        let stories: [String: [String]] = [
            "moon": [
                "there lived a gentle moon who watched over all the sleeping children. Every night, the moon would sing soft lullabies to help everyone have sweet dreams.",
                "the moon decided to visit Earth. She sprinkled stardust everywhere, making flowers glow and turning puddles into mirrors that reflected beautiful dreams."
            ],
            "star": [
                "lived a little star who was too shy to shine. With the help of kind friends, the star learned that even the smallest light can guide someone home.",
                "a shooting star granted wishes to all the good children. The star traveled across the sky, leaving trails of sparkles and making dreams come true."
            ],
            "unicorn": [
                "lived a friendly unicorn with a rainbow mane. The unicorn loved to help lost animals find their way home and always had a warm hug for anyone who needed one.",
                "there was a magical unicorn who could heal sadness with her horn. She would visit children who felt scared and fill their hearts with courage and love."
            ],
            "bear": [
                "lived a cuddly bear who loved to tell stories. Every evening, forest animals would gather around while the bear shared tales of adventure and friendship.",
                "there was a gentle bear who collected hugs. The bear would travel from house to house, giving the warmest, softest hugs to help children feel safe and loved."
            ],
            "bunny": [
                "lived a playful bunny who loved to hop through meadows. The bunny would collect the softest clouds to make pillows for tired forest friends.",
                "there was a wise bunny who knew the secret to sweet dreams. The bunny would whisper magical words that chased away any worries and brought peaceful sleep."
            ]
        ]
        
        let characterStories = stories[character] ?? [
            "there was a wonderful \(character) who brought joy and happiness to everyone around. This magical friend had many adventures and always helped others."
        ]
        
        return characterStories.randomElement() ?? characterStories[0]
    }
    
    private func createMultiCharacterStory(characters: [String]) -> String {
        let primary = characters[0]
        let secondary = characters[1]
        
        // Create friendship-based stories
        let friendshipStories = [
            "lived a kind \(primary) and a gentle \(secondary) who were the best of friends. Together, they went on magical adventures, always helping others and spreading joy wherever they went. They discovered that friendship makes every day brighter and every problem easier to solve.",
            
            "there was a brave \(primary) who met a wise \(secondary). They became fast friends and decided to help all the creatures in their magical world. Together, they built a place where everyone felt safe, loved, and happy.",
            
            "lived a curious \(primary) and a caring \(secondary) who loved to explore. They found a secret garden where they planted seeds of kindness that grew into beautiful flowers of friendship. All the animals came to visit and play in their wonderful garden.",
            
            "there was a playful \(primary) and a thoughtful \(secondary) who discovered they could create rainbows together. They painted the sky with beautiful colors and made sure every child could see the magic in the world around them."
        ]
        
        // Add other characters to the story if there are more
        var story = friendshipStories.randomElement() ?? friendshipStories[0]
        
        if characters.count > 2 {
            let additionalCharacters = characters.dropFirst(2)
            let characterList = additionalCharacters.joined(separator: ", ")
            story += " Along the way, they met other wonderful friends like \(characterList), and together they created the most magical adventures filled with laughter, love, and wonder."
        }
        
        return story
    }
}