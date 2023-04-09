//
//  StarView.swift
//  MoonPhaseForStarPhotography
//
//  Created by 관식 on 2023/04/07.
//

import SwiftUI

struct StarView: View {
    
    @Binding var today: Date
    @State var position = CGPoint(x: 0, y: 0)
    @State var opacity: [[Double]] = [
        [1.0, 1.0, 1.0],
        [0.8, 0.9, 1.0],
        [0.6, 0.7, 0.8],
        [0.4, 0.5, 0.6],
        [0.2, 0.3, 0.4],
        [0.1, 0.2, 0.3],
        [0.0, 0.1, 0.2],
        [0.1, 0.2, 0.3],
        [0.2, 0.3, 0.4],
        [0.4, 0.5, 0.6],
        [0.6, 0.7, 0.8],
        [0.8, 0.9, 1.0]
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<75) { _ in
                    Circle()
                        .foregroundColor(Color("light"))
                        .opacity(opacity[moonPhase(today)][0])
                        .frame(width: 2, height: 2)
                        .position(randomCirclePosition(in: geometry.size))
                }
                .animation(Animation.linear(duration: 60).repeatForever(), value: position)
                .onAppear {
                    self.position = randomCirclePosition(in: geometry.size)
                    Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { _ in
                        self.position = randomCirclePosition(in: geometry.size)
                    }
                }
                ForEach(0..<50) { _ in
                    Circle()
                        .foregroundColor(Color("light"))
                        .opacity(opacity[moonPhase(today)][1])
                        .frame(width: 3, height: 3)
                        .position(randomCirclePosition(in: geometry.size))
                }
                .animation(Animation.linear(duration: 80).repeatForever(), value: position)
                .onAppear {
                    self.position = randomCirclePosition(in: geometry.size)
                    Timer.scheduledTimer(withTimeInterval: 80, repeats: true) { _ in
                        self.position = randomCirclePosition(in: geometry.size)
                    }
                }
                ForEach(0..<25) { _ in
                    Circle()
                        .foregroundColor(Color("light"))
                        .opacity(opacity[moonPhase(today)][2])
                        .frame(width: 4, height: 4)
                        .position(randomCirclePosition(in: geometry.size))
                }
                .animation(Animation.linear(duration: 100).repeatForever(), value: position)
                .onAppear {
                    self.position = randomCirclePosition(in: geometry.size)
                    Timer.scheduledTimer(withTimeInterval: 100, repeats: true) { _ in
                        self.position = randomCirclePosition(in: geometry.size)
                    }
                }
            }
        }
    }
    
    func randomCirclePosition(in size: CGSize) -> CGPoint {
        let x = CGFloat.random(in: -20..<size.width+20)
        let y = CGFloat.random(in: -20..<size.height+40)
        return CGPoint(x: x, y: y)
    }
}
