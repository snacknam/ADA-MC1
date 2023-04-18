import SwiftUI

struct LaunchScreenView: View {
    
    @State var isLaunch = false
    
    var body: some View {
        if isLaunch {
            ContentView()
        } else {
            ZStack {
                Color("background")
                    .edgesIgnoringSafeArea(.all)
                Image("logo")
                    .resizable()
                    .frame(width: 80, height: 80)
            }
            .preferredColorScheme(.dark)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        isLaunch = true
                    }
                }
            }
        }
    }
}
