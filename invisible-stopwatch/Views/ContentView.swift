//
//  ContentView.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/06.
//

import SwiftUI

struct ContentView: View {
    @State var invisibleMode: Bool = false
    @State var showHelp: Bool = false
    var body: some View {
        GeometryReader { geo in
            ZStack {
                GestureView(invisibleMode: $invisibleMode)
                VStack {
                    Spacer()
                    if showHelp {
                        VStack {
                            Text("1. Single Tap to Record Lap").caption()
                            Text("2. Double Tap to Start/Stop").caption()
                            Text("3. Long Press to Hide/Show").caption()
                        }
                    }
                    VSpacer(10)
                    Timer(invisibleMode: $invisibleMode).allowsHitTesting(false)
                        .padding(.bottom, invisibleMode ? geo.size.height/2 : 0)
                    if !invisibleMode {
                        LapList().frame(height: geo.size.height/2)
                    }
                }
                VStack {
                    Spacer()
                    Button(action: {
                        withAnimation(.spring()) { showHelp.toggle() }
                    }) {
                        HStack(spacing: 5) {
                            Image(systemName: "questionmark.circle")
                            Text("How to Use?").nanumSquareR(size: 15, .regular, .green)
                        }.foregroundColor(.green)
                    }
                    VSpacer(10)
                }
            }
        }
    }
}
