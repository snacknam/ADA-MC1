import SwiftUI
import AVFoundation


var player: AVAudioPlayer?


struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color("bg")
            StarView()
            MainView()
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            guard let url = Bundle.main.url(forResource: "DeepSpace", withExtension: "mp3") else { return }
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch (let err) {
                print(err.localizedDescription)
            }
        }
    }
}

struct StarView: View {
    
    @State private var position = CGPoint(x: 0, y: 0)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<100) { _ in
                    Circle()
                        .fill(Color("moon"))
                        .opacity(0.2)
                        .frame(width: 2, height: 2)
                        .position(
                            x: CGFloat.random(in: -100...UIScreen.main.bounds.width+100),
                            y: CGFloat.random(in: -100...UIScreen.main.bounds.height+100)
                        )
                }
                ForEach(0..<100) { _ in
                    Circle()
                        .fill(Color("moon"))
                        .opacity(0.35)
                        .frame(width: 2, height: 2)
                        .position(
                            x: CGFloat.random(in: -100...UIScreen.main.bounds.width+100),
                            y: CGFloat.random(in: -100...UIScreen.main.bounds.height+100)
                        )
                }
                ForEach(0..<100) { _ in
                    Circle()
                        .fill(Color("moon"))
                        .opacity(0.5)
                        .frame(width: 3, height: 3)
                        .position(
                            x: CGFloat.random(in: -100...UIScreen.main.bounds.width+100),
                            y: CGFloat.random(in: -100...UIScreen.main.bounds.height+100)
                        )
                }
            }
            .animation(Animation.linear(duration: 60).repeatForever(), value: position)
            .onAppear {
                self.position = randomCirclePosition(in: geometry.size)
                Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
                    self.position = randomCirclePosition(in: geometry.size)
                }
            }
        }
    }
    
    private func randomCirclePosition(in size: CGSize) -> CGPoint {
        let x = CGFloat.random(in: 0..<size.width)
        let y = CGFloat.random(in: 0..<size.height)
        return CGPoint(x: x, y: y)
    }
}

struct MoonView: View {
    
    @State var throb = false
    
    var body: some View {
        ZStack {
            Circle()
            Circle()
                .foregroundColor(Color("moon"))
                .blur(radius: throb ? 8 : 16)
                .animation(.easeInOut(duration: 2).repeatForever(), value: throb)
                .onAppear {
                    throb.toggle()
                }
            Circle()
                .foregroundColor(Color("moon"))
        }
        .frame(width: 200, height: 200)
    }
}

struct MainView: View {
    
    @State var today = Date()
    var todayMoon = MoonData()
    
    var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        return formatter
    }
    
    var body: some View {
        VStack (spacing: 120) {
            VStack (spacing: 4) {
                Text("\(today, formatter: dayFormatter)")
                    .foregroundColor(.white)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            self.today = Date()
                        }
                    }
                    .font(.system(size: 24))
                Text(todayMoon.moonExpression[moonPhase()].title)
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .medium))
            }
            MoonView()
            Text(todayMoon.moonExpression[moonPhase()].description)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .frame(width: 360)
                .lineSpacing(4)
        }
    }
}

//struct CircleView: View {
//    @State private var position = CGPoint(x: 0, y: 0) // 원의 위치를 저장하는 State 변수
//
//    var body: some View {
//        GeometryReader { geometry in
//            // 움직이는 원
//            Circle()
//                .fill(Color.blue)
//                .frame(width: 50, height: 50)
//                .position(position)
//                .animation(Animation.linear(duration: 20).repeatForever()) // 무한 반복 애니메이션
//                .onAppear {
//                    // 뷰가 처음 나타날 때, 무작위 위치에서 시작
//                    self.position = randomCirclePosition(in: geometry.size)
//                }
//                .onReceive(Timer.publish(every: 20, on: .main, in: .common).autoconnect()) { _ in
//                    // 2초마다 원의 위치를 무작위로 변경
//                    withAnimation(.linear(duration: 5)) {
//                        self.position = randomCirclePosition(in: geometry.size)
//                    }
//                }
//        }
//    }
//
//    // 임의의 좌표에 원을 배치하기 위한 메서드
//    private func randomCirclePosition(in size: CGSize) -> CGPoint {
//        let x = CGFloat.random(in: 0..<size.width)
//        let y = CGFloat.random(in: 0..<size.height)
//        return CGPoint(x: x, y: y)
//    }
//}
