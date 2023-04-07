import SwiftUI
import AVFoundation


var player: AVAudioPlayer?

struct ContentView: View {
    
    @State var today = Date()
    
    var body: some View {
        ZStack {
            Color("bg")
            StarView(today: $today)
            MainView(today: $today)
        }
        .edgesIgnoringSafeArea(.all)
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

struct MainView: View {
    
    @Binding var today: Date
    
    var todayMoon = MoonData()
    
    var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        return formatter
    }
    
    var body: some View {
        VStack (spacing: 120) {
            VStack {
                Text("\(today, formatter: dayFormatter)")
                    .foregroundColor(.white)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            today = today
                        }
                    }
                    .font(.system(size: 32, weight: .light))
                Text(todayMoon.moonExpression[moonPhase(today)].title)
                    .foregroundColor(.white)
                    .font(.system(size: 64, weight: .medium))
            }
            MoonView(today: $today)
            Text(todayMoon.moonExpression[moonPhase(today)].description)
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .light))
                .multilineTextAlignment(.center)
                .frame(width: 640)
                .lineSpacing(8)
        }
        .onTapGesture {
            today = Calendar.current.date(byAdding: .day, value: 1, to: today)!
            print("메인\(today)")
        }
    }
}
