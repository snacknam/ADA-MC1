//
//  MainView.swift
//  MC1_Project
//
//  Created by 관식 on 2023/03/29.
//

import SwiftUI

struct MainView: View {
    
    @State private var currentTime = Date()
    @State var isCardTapped: Bool = false
    
    var body: some View {
        
        VStack(spacing: 20) {
            HStack {
                VStack(alignment: .leading) {
                    Text("회의중인 지금 시간은...")
                        .font(.system(size: 16))
                    HStack(alignment: .firstTextBaseline) {
                        Text("\(currentTime, formatter: amPmFormatter)")
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                    self.currentTime = Date()
                                }
                            }
                            .font(.system(size: 24))
                        Text("\(currentTime, formatter: timeFormatter)")
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                    self.currentTime = Date()
                                }
                            }
                            .font(.system(size: 48, weight: .bold))
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            ZStack {
                TabView {
                    ForEach(0..<30) { index in
                        Image("card")
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .shadow(color: Color("shadow"), radius: 8, y: 4)
                    VStack(spacing: 20) {
                        Text(card[cardNumber].cardEmoji)
                            .foregroundColor(.black)
                            .font(.system(size: 40, weight: .bold))
                        Text(card[cardNumber].cardTitle)
                            .foregroundColor(.black)
                            .font(.system(size: 32, weight: .bold))
                            .multilineTextAlignment(.center)
                            .frame(width: 280)
                        Text(card[cardNumber].cardDescription)
                            .foregroundColor(.black)
                            .font(.system(size: 16))
                            .lineSpacing(4)
                            .multilineTextAlignment(.center)
                            .frame(width: 240)
                    }
                }
                .frame(
                    width: 357.5,
                    height: 506)
                .offset(y: isCardTapped ? 0 : 32)
                .opacity(isCardTapped ? 1 : 0)
                .foregroundColor(.white)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        isCardTapped.toggle()
                        cardNumber = Int.random(in: 0..<card.count)
                    }
                }
            }
            VStack {
                Image("up")
                Text("카드를 뽑아주세요")
                    .font(.system(size: 16, weight: .medium))
            }
            .opacity(isCardTapped ? 0 : 1)
        }
        .padding(.vertical, 40)
        .background(Color("bg"))
    }
    
    var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm"
        return formatter
    }
    var amPmFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "a"
        return formatter
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
