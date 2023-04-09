import SwiftUI
import AVFoundation


var player: AVAudioPlayer?

struct ContentView: View {
    
    @State var today = Date()
    
    var body: some View {
        
        let swipeGesture = DragGesture()
            .onEnded { value in
                if value.translation.width > 0 {
                    today = Calendar.current.date(byAdding: .day, value: -1, to: today)!
                } else {
                    today = Calendar.current.date(byAdding: .day, value: 1, to: today)!
                }
            }
        
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            StarView(today: $today)
            MainView(today: $today)
//            VStack {
//                HStack{
//                    DatePicker("", selection: $today, displayedComponents: .date)
//                        .datePickerStyle(CompactDatePickerStyle())
//                        .labelsHidden()
//                    Spacer()
//                }
//                Spacer()
//            }
//            .padding(.all, 20)
        }
        .gesture(swipeGesture)
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
