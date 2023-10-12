//
//  ContentView.swift
//  NoticableSquare
//
//  Created by Nikita Timonin on 11.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var position: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.white
                Color.pink
                Color.yellow
                Color.black
            }.ignoresSafeArea()
            
           Rectangle()
                .fill(.white)
                .blendMode(.difference)
                .overlay(content: {
                    Rectangle()
                        .blendMode(.hue)
                })
                .overlay(content: {
                    Rectangle()
                        .fill(.white)
                        .blendMode(.overlay)
                })
                .overlay(content: {
                    Rectangle()
                        .fill(.black)
                        .blendMode(.overlay)
                })
                .frame(width: 90.0, height: 90.0)
                .cornerRadius(10.0)
                .offset(position)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.position = value.translation
                        })
                        .onEnded({ value in
                            withAnimation {
                                self.position = .zero
                            }
                        })
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
