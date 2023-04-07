//
//  MoonView.swift
//  MoonPhaseForStarPhotography
//
//  Created by 관식 on 2023/04/07.
//

import SwiftUI

struct MoonView: View {
    
    @Binding var today: Date
    @State var throb = false

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color("shadow"))
            Image("\(moonPhase(today))")
                .resizable()
                .blur(radius: throb ? 8 : 16 )
                .animation(.easeInOut(duration: 2).repeatForever(), value: throb)
                .onAppear {
                    throb.toggle()
                }
            Image("\(moonPhase(today))")
                .resizable()
        }
        .frame(width: 320, height: 320)
        .rotationEffect(.degrees(-20))
    }
}
