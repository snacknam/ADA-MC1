import SwiftUI

struct ContentView: View {
    
    @State var today = Date()
    var todayMoon = MoonData()
    
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
                    Text(todayMoon.moonExpression[moonPhase()].title)
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
                Text(todayMoon.moonExpression[moonPhase()].description)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .frame(width: 360)
                    .lineSpacing(4)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func moonPhase() -> Int {
        let lunarPhaseStart = Date("01/07/1970")
        let daysSinceStart = Calendar.current.dateComponents(
            [.day],
            from: lunarPhaseStart,
            to: Date()
        ).day!

        let seconds = daysSinceStart * 86400 + 12300
        let lunarMonths = seconds % 2551443
        let lunarMonthPart = lunarMonths / 637861
        let secondsSinceMainPhase = lunarMonths % 637861

        let index = 2 * lunarMonthPart + (86400 <= secondsSinceMainPhase ? 1 : 0)

//        let lunarPhases = ["🌑", "🌒", "🌓", "🌔", "🌕", "🌖", "🌗", "🌘"]
//        let lunarPhase = lunarPhases[index]

        return index
    }
}
