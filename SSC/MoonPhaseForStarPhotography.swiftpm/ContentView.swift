import SwiftUI

struct ContentView: View {
    
    @State var today = Date()
    var todayMoon = MoonData()
    lazy var moonPhaseIndex = todayMoon.moonPhase()
    
    var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        return formatter
    }
    
    var body: some View {
        ZStack {
            Color("bg")
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
                    Text(todayMoon.moonExpression[moonPhaseIndex].title)
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .medium))
                }
                ZStack {
                    Circle()
                    Circle()
                        .foregroundColor(Color("moon"))
                        .blur(radius: 16)
                    Circle()
                        .foregroundColor(Color("moon"))
                }
                .frame(width: 200, height: 200)
                Text(todayMoon.moonExpression[0].description)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .frame(width: 360)
                    .lineSpacing(4)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
