//
//  CircleView.swift
//  AnimationAppSwiftUI
//
//  Created by Игорь Богданов on 24.08.2022.
//

import SwiftUI

struct CirclesView: View {
    @Binding var showAnimation: Bool
    let defaultLinearGradient = LinearGradient(
        colors: [.green],
        startPoint: UnitPoint(x: 0.5, y: 0.5),
        endPoint: UnitPoint(x: 0.5, y: 0.5))
    let firstLinearGradient = LinearGradient(
        colors: [.green,.blue],
        startPoint: UnitPoint(x: 0, y: 1),
        endPoint: UnitPoint(x: 1, y: 0))
    let secondLinearGradient = LinearGradient(
        colors: [.yellow,.red],
        startPoint: UnitPoint(x: 1, y: 0),
        endPoint: UnitPoint(x: 0, y: 1))
    let defaultRadialGradient = RadialGradient(
        colors: [.green],
        center: UnitPoint(x: 1, y: 1),
        startRadius: 5,
        endRadius: 25)
    let radialGradient = RadialGradient(
        colors: [.brown,.purple],
        center: UnitPoint(x: 0.5, y: 0.5),
        startRadius: 12,
        endRadius: 17)
    
    
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let hight = geometry.size.height
            let size = min(width, hight)
            let quatter = size / 4
            let half = size / 2
            withAnimation {
                Path { path in
                    path.addArc(
                        center: CGPoint(x: quatter, y: half ),
                        radius: quatter,
                        startAngle: .degrees(0),
                        endAngle: .degrees(180),
                        clockwise: true
                    )
                }
                .fill(
                    showAnimation
                    ? firstLinearGradient
                    : defaultLinearGradient
                )
                .offset(x: showAnimation
                        ? 0
                        : -UIScreen.main.bounds.width)
                .rotationEffect(
                    showAnimation
                    ? .degrees(720)
                    : .degrees(0)
                )
                .animation(showAnimation ? .easeIn(duration: 2.7) : nil)
            }
            withAnimation {
                Path { path in
                    path.addArc(
                        center: CGPoint(x: width - quatter, y: half),
                        radius: quatter,
                        startAngle: .degrees(0),
                        endAngle: .degrees(180),
                        clockwise: true
                    )
                }
                .fill(
                    showAnimation
                    ? secondLinearGradient
                    : defaultLinearGradient
                )
                .opacity(showAnimation ? 1 : 0)
                .animation(showAnimation ? .linear(duration: 2.7) : nil)
            }
            withAnimation {
                Path { path in
                    path.addArc(
                        center: CGPoint(x: half, y: half),
                        radius: quatter,
                        startAngle: .degrees(0),
                        endAngle: .degrees(180),
                        clockwise: false)
                }
                .offset(
                    y: showAnimation
                    ? 0
                    : UIScreen.main.bounds.height
                )
                .fill(
                    showAnimation
                    ? radialGradient
                    : defaultRadialGradient
                )
                .animation(
                    showAnimation
                    ? .spring(response: 1, dampingFraction: 0.5, blendDuration: 2.7)
                    : nil
                )
            }
        }
    }
}

struct CirclesView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesView(showAnimation: .constant(true))
            .frame(width: 200, height: 200)
    }
}
