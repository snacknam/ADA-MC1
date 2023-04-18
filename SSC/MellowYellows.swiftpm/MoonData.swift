import Foundation

struct Moons {
    let title: String
    let description: String
}

struct MoonData {
    
    let moonExpression: [Moons] = [
        Moons(title: "New Moon", description: "The night sky is feeling a little empty tonight, but don't be fooled! It's the perfect time to capture the twinkling stars in all their glory."),
        Moons(title: "Waxing Crescent", description: "A sliver of a moon is gracing us with its presence tonight, like a shy smile in the dark. Take a picture and share the beauty!"),
        Moons(title: "Waxing Crescent", description: "A sliver of a moon is gracing us with its presence tonight, like a shy smile in the dark. Take a picture and share the beauty!"),
        Moons(title: "First Quater", description: "Half moon, half mystery. The perfect time to capture the contrast of light and dark in the night sky."),
        Moons(title: "Waxing Gibbous", description: "The moon is growing fuller by the night, like a balloon filling with light. Don't miss the chance to snap a photo of this cosmic expansion!"),
        Moons(title: "Waxing Gibbous", description: "The moon is growing fuller by the night, like a balloon filling with light. Don't miss the chance to snap a photo of this cosmic expansion!"),
        Moons(title: "Full Moon", description: "The roundest, brightest, most mesmerizing moon has risen above us. Don't let its beauty go to waste - snap a picture that captures the magic!"),
        Moons(title: "Waning Gibbous", description: "The moon is starting to shrink, but its luminosity remains undiminished. Take advantage of its lingering presence and snap a photo before it disappears!"),
        Moons(title: "Waning Gibbous", description: "The moon is starting to shrink, but its luminosity remains undiminished. Take advantage of its lingering presence and snap a photo before it disappears!"),
        Moons(title: "Third Quarter", description: "The moon is waning, but that doesn't mean the sky is any less beautiful. Use this time to capture the balance between light and shadow in your photography."),
        Moons(title: "Waning Crescent", description: "The moon is almost gone, but the stars are still shining bright. Take a photo that showcases the contrast between the moon's fading light and the sparkling sky!"),
        Moons(title: "Waning Crescent", description: "The moon is almost gone, but the stars are still shining bright. Take a photo that showcases the contrast between the moon's fading light and the sparkling sky!"),
    ]
}

func moonPhase(_ date: Date) -> Int {
    let lunarPhaseStart = Date("01/07/1970")
    let daysSinceStart = Calendar.current.dateComponents([.day], from: lunarPhaseStart, to: date).day!
    let seconds = daysSinceStart * 86400 + 12300
    let lunarMonths = seconds % 2551443
    let lunarMonthPart = Double(lunarMonths) / 212765.25
    let index = Int(lunarMonthPart.rounded()) % 12
    return index
}
