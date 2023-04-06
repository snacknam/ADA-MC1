//
//  MoonView.swift
//  MoonPhaseForStarPhotography
//
//  Created by 관식 on 2023/04/07.
//

import SwiftUI

struct MoonView: View {
    
    @State var throb = false
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color("shadow"))
            Image("\(moonPhase())")
                .blur(radius: throb ? 8 : 16 )
                .animation(.easeInOut(duration: 2).repeatForever(), value: throb)
                .onAppear {
                    throb.toggle()
                }
            Image("\(moonPhase())")
        }
        .frame(width: 200, height: 200)
        .rotationEffect(.degrees(-20))
    }
}
