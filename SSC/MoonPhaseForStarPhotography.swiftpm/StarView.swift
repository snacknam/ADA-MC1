//
//  StarView.swift
//  MoonPhaseForStarPhotography
//
//  Created by 관식 on 2023/04/07.
//

import SwiftUI

struct StarView: View {
    
    @State var position = CGPoint(x: 0, y: 0)
    
    @State var opacity: [[Double]] = [
        [0.4, 0.5, 0.6],
        [0.3, 0.4, 0.5],
        [0.2, 0.3, 0.4],
        [0.1, 0.2, 0.3],
        [0.0, 0.1, 0.2],
        [0.1, 0.2, 0.3],
        [0.2, 0.3, 0.4],
        [0.3, 0.4, 0.5]
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<150) { _ in
                    Circle()
                        .fill(Color("moon"))
                        .opacity(opacity[moonPhase()][0])
                        .frame(width: 1.5, height: 1.5)
                        .position(randomCirclePosition(in: geometry.size))
                }
                ForEach(0..<100) { _ in
                    Circle()
                        .fill(Color("moon"))
                        .opacity(opacity[moonPhase()][1])
                        .frame(width: 2.5, height: 2.5)
                        .position(randomCirclePosition(in: geometry.size))
                }
                ForEach(0..<50) { _ in
                    Circle()
                        .fill(Color("moon"))
                        .opacity(opacity[moonPhase()][2])
                        .frame(width: 3.5, height: 3.5)
                        .position(randomCirclePosition(in: geometry.size))
                }
            }
            .animation(Animation.linear(duration: 80).repeatForever(), value: position)
            .onAppear {
                self.position = randomCirclePosition(in: geometry.size)
                Timer.scheduledTimer(withTimeInterval: 80, repeats: true) { _ in
                    self.position = randomCirclePosition(in: geometry.size)
                }
            }
        }
    }
    
    func randomCirclePosition(in size: CGSize) -> CGPoint {
        let x = CGFloat.random(in: -100..<size.width+100)
        let y = CGFloat.random(in: -100..<size.height+100)
        return CGPoint(x: x, y: y)
    }
}
