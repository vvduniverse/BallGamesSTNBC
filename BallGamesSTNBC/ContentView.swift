//
//  ContentView.swift
//  BallGamesSTNBC
//
//  Created by Vahtee Boo on 03.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    @State private var count = 0
    
    var body: some View {
        ZStack {
            RadialGradient(
                colors: [Color("ColorGInner"), Color("ColorGOutter")],
                center: .center,
                startRadius: 5,
                endRadius: 500)
            .ignoresSafeArea()
            
            HStack(spacing: 15) {
                Circle()
                    .offset(y: count == 1 ? 100 : 0)
                Circle()
                    .offset(y: count == 2 ? -100 : 0)
                Circle()
                    .offset(y: count == 3 ? 100 : 0)
                Circle()
                    .offset(y: count == 4 ? -100 : 0)
                Circle()
                    .offset(y: count == 5 ? 100 : 0)
                Circle()
                    .offset(y: count == 6 ? -100 : 0)
            }
            .padding()
            .foregroundColor(.white)
        }
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 1.0)) {
                count = count == 6 ? 1 : count + 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
