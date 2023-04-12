import SwiftUI
import AVFoundation


var player: AVAudioPlayer?

struct ContentView: View {
    
    @State var today: Date = Date()
    @State var weatherNumber: Int = Int.random(in: 0...5)
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            StarView(today: $today)
            MainView(weatherNumber: $weatherNumber, today: $today)
            CloudView(weatherNumber: $weatherNumber)
                .animation(Animation.easeInOut(duration: 0.8), value: weatherNumber)
            
        }
        .onAppear {
            guard let url = Bundle.main.url(forResource: "bgm", withExtension: "mp3") else { return }
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.numberOfLoops = -1
                player?.play()
            } catch (let err) {
                print(err.localizedDescription)
            }
        }
    }
}
