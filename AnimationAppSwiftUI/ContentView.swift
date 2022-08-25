//
//  ContentView.swift
//  AnimationAppSwiftUI
//
//  Created by Игорь Богданов on 24.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State var showAnimation = false
    var body: some View {
        VStack {
            Spacer()
            CirclesView(showAnimation: $showAnimation)
                .frame(width: 200, height: 200)
            Spacer()
            Button {
                withAnimation {
                    showAnimation.toggle()
                }
            } label: {
                Text(showAnimation ? "Hide figure" : "Show figure")
                    .rotationEffect(showAnimation ? .degrees(360) : .degrees(0))
                    .animation(.default, value: 10)
            }

        }
        .padding()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
  }
}
