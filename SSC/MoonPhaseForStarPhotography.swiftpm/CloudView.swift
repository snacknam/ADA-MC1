//
//  CloudView.swift
//  MoonPhaseForStarPhotography
//
//  Created by 관식 on 2023/04/11.
//

import SwiftUI

struct CloudView: View {
    
    @State var position: CGPoint = CGPoint(x: 0, y: 0)
    @State var opacity: [Double] = [0, 0, 0, 0, 0, 0, 0.05, 0.1]
    @Binding var weatherNumber: Int
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<8) { _ in
                Circle()
                    .frame(width: 400, height: 400)
                    .foregroundColor(.gray)
                    .opacity(opacity[weatherNumber])
                    .blur(radius: 30)
                    .onAppear {
                        position = randomCirclePosition(in: geometry.size)
                        }
                    .position(randomCirclePosition(in: geometry.size))
                }
            ForEach(0..<4) { _ in
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.gray)
                    .opacity(opacity[weatherNumber])
                    .blur(radius: 30)
                    .onAppear {
                        position = randomCirclePosition(in: geometry.size)
                        }
                    .position(randomCirclePosition(in: geometry.size))
                }
            ForEach(0..<2) { _ in
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.gray)
                    .opacity(opacity[weatherNumber])
                    .blur(radius: 30)
                    .onAppear {
                        position = randomCirclePosition(in: geometry.size)
                        }
                    .position(randomCirclePosition(in: geometry.size))
                }
            }
        }
    
    func randomCirclePosition(in size: CGSize) -> CGPoint {
        let x = CGFloat.random(in: -20..<size.width+20)
        let y = CGFloat.random(in: -20..<size.height+20)
        return CGPoint(x: x, y: y)
    }
}

