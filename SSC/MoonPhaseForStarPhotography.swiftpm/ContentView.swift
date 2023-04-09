import SwiftUI
import AVFoundation


var player: AVAudioPlayer?

struct ContentView: View {
    
    @State var today = Date()
    
    var body: some View {
        ZStack {
            Color("background")
            StarView(today: $today)
            MainView(today: $today)
        }
        .edgesIgnoringSafeArea(.all)
//        .onAppear {
//            guard let url = Bundle.main.url(forResource: "bgm", withExtension: "mp3") else { return }
//            do {
//                player = try AVAudioPlayer(contentsOf: url)
//                player?.numberOfLoops = -1
//                player?.play()
//            } catch (let err) {
//                print(err.localizedDescription)
//            }
//        }
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
        ZStack {
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
                    .animation(Animation.easeInOut(duration: 0.3), value: today)
                Text(todayMoon.moonExpression[moonPhase(today)].description)
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .light))
                    .multilineTextAlignment(.center)
                    .frame(width: 640, height: 120, alignment: .top)
                    .lineSpacing(8)
            }
            .padding(.vertical, 160)
            VStack {
                Spacer()
                HStack {
                    Button {
                        today = Calendar.current.date(byAdding: .day, value: -1, to: today)!
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 32, height: 32)
                    }
                    Spacer()
                    Button {
                        today = Calendar.current.date(byAdding: .day, value: 1, to: today)!
                    } label: {
                        Image(systemName: "arrow.forward")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 32, height: 32)
                    }
                }
            }
            .padding(.all, 40)
        }
    }
}
