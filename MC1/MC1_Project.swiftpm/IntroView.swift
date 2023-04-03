import SwiftUI

struct IntroView: View {
    
    @State var selectedPage: Int = 1
    @State var isHidden: Bool = true
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                TabView(selection: $selectedPage) {
                    IntroScrollView(titleText: "생각도 많이하고\n결정하느라 오래 걸리는 회의", imageName: "intro_1")
                        .tag(1)
                    IntroScrollView(titleText: "우리만의\n재미있는 방법으로 끝내보세요", imageName: "intro_2")
                        .tag(2)
                    IntroScrollView(titleText: "빨리 회의 끝내고\n퇴근합시다!", imageName: "intro_3")
                        .tag(3)
                }
                .onChange(of: selectedPage) {
                    value in
                    print("selected tab = \(value)")
                    start(index: value)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                HStack(spacing: 6){
                    Circle()
                        .fill(selectedPage == 1 ? Color.black : Color.gray)
                        .frame(width: 6, height: 6)
                    Circle()
                        .fill(selectedPage == 2 ? Color.black : Color.gray)
                        .frame(width: 6, height: 6)
                    Circle()
                        .fill(selectedPage == 3 ? Color.black : Color.gray)
                        .frame(width: 6, height: 6)
                }
                NavigationLink("시작하기") {
                    MainView().navigationBarBackButtonHidden(true)
                }
                .frame(width: 335, height: 50)
                .background(Color(.black))
                .foregroundColor(.white)
                .cornerRadius(25)
                .opacity(isHidden ? 0 : 1)
            }
        }
        .navigationTitle("intro")

    }
    
    func start(index: Int) {
        if index == 3 {
            self.isHidden = false
        } else {
            self.isHidden = true
        }
    }
}

struct IntroScrollView: View {
    
    let titleText: String
    let imageName: String
    
    var body: some View {
        VStack(spacing: 64) {
            Text(titleText)
                .font(.system(size: 24))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Image(imageName)
                .resizable()
                .frame(width: 335, height: 348)
                .padding(.all, 20)
        }
    }
}

