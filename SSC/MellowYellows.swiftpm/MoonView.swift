import SwiftUI

struct MoonView: View {
    
    @Binding var today: Date
    @State var throb = false

    var body: some View {
        ZStack {
            Image("shadow")
                .resizable()
            Image("\(moonPhase(today))")
                .resizable()
                .blur(radius: throb ? 8 : 24)
                .animation(.easeInOut(duration: 2).repeatForever(), value: throb)
                .onAppear {
                    throb.toggle()
                }
            Image("\(moonPhase(today))")
                .resizable()
        }
        .frame(width: 200, height: 200)
        .rotationEffect(.degrees(-20))
    }
}
