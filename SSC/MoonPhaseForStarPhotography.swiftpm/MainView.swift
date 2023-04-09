//
//  MainView.swift
//  MoonPhaseForStarPhotography
//
//  Created by 관식 on 2023/04/10.
//

import SwiftUI

struct MainView: View {
    
    @State var showModal = false
    @Binding var today: Date
    
    var todayMoon = MoonData()
    
    var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        return formatter
    }
    
    var body: some View {
        VStack (spacing: 100) {
            VStack {
                Text("\(today, formatter: dayFormatter)")
                    .foregroundColor(.white)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            today = today
                        }
                    }
                    .font(.system(size: 20, weight: .light))
                Text(todayMoon.moonExpression[moonPhase(today)].title)
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .medium))
            }
            MoonView(today: $today)
                .animation(Animation.easeInOut(duration: 0.3), value: today)
                .onTapGesture {
                    self.showModal = true
                }
                .sheet(isPresented: self.$showModal) {
                    ModalView()
                }
            Text(todayMoon.moonExpression[moonPhase(today)].description)
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .light))
                .multilineTextAlignment(.center)
                .frame(width: 320, height: 160, alignment: .top)
                .lineSpacing(4)
        }
        .padding(.top, 64)
    }
}

struct ModalView: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            Color("background")
        }
        .edgesIgnoringSafeArea(.all)
    }
}
