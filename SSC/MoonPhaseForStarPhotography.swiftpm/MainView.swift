//
//  MainView.swift
//  MoonPhaseForStarPhotography
//
//  Created by 관식 on 2023/04/10.
//

import SwiftUI

struct MainView: View {
    
    @State private var isActive = false
    @State private var offset = 500.0
    @State var showBottomSheet = false
    
    @Binding var weatherNumber: Int
    @Binding var today: Date
   
    var todayMoon = MoonData()
    
    var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        return formatter
    }
    
    var body: some View {
        ZStack {
            VStack (spacing: 100) {
                VStack (spacing: 4) {
                    HStack {
                        Image(systemName: weathers[weatherNumber])
                            .foregroundColor(.white)
                        Text("\(today, formatter: dayFormatter)")
                            .foregroundColor(.white)
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                    today = today
                                }
                            }
                            .font(.system(size: 20, weight: .regular))
                    }
                    Text(todayMoon.moonExpression[moonPhase(today)].title)
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .medium))
                }
                .opacity(isActive ? 1 : 0)
                MoonView(today: $today)
                    .offset(y: offset)
                    .onAppear {
                        withAnimation(.easeOut(duration: 2.0)) {
                            offset = 0
                        }
                    }
                    .animation(Animation.easeInOut(duration: 0.3), value: today)
                Text(todayMoon.moonExpression[moonPhase(today)].description)
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .light))
                    .multilineTextAlignment(.center)
                    .frame(width: 320, height: 160, alignment: .top)
                    .lineSpacing(4)
                    .opacity(isActive ? 1 : 0)
            }
            .padding(.top, 80)
            VStack {
                HStack {
                    Button {
                        showBottomSheet = true
                    } label: {
                        Image(systemName: "calendar")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    .sheet(isPresented: $showBottomSheet) {
                        BottomSheetView(today: $today, showBottomSheet: $showBottomSheet)
                    }
                    Spacer()
                }
                .padding(.top, 16)
                Spacer()
                HStack {
                    Button {
                        today = Calendar.current.date(byAdding: .day, value: -1, to: today)!
                        weatherNumber = Int.random(in: 0...7)
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                    Button {
                        today = Calendar.current.date(byAdding: .day, value: 1, to: today)!
                        weatherNumber = Int.random(in: 0...7)
                    } label: {
                        Image(systemName: "arrow.forward")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .opacity(isActive ? 1 : 0)
            .padding(.horizontal, 32)
            .padding(.bottom, 4)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}
