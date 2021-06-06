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
        ZStack {
            GestureView(invisibleMode: $invisibleMode)
            VStack {
                if showHelp {
                    VStack {
                        Text("1. Single Tap to Record Lap").caption()
                        Text("2. Double Tap to Start/Stop").caption()
                        Text("3. Long Press to Hide/Show").caption()
                    }
                }
                VSpacer(10)
                Timer(invisibleMode: $invisibleMode).allowsHitTesting(false)
                
            }
            VStack {
                Spacer()
                Button(action: {
                    withAnimation(.spring()) { showHelp.toggle() }
                }) {
                    HStack(spacing: 5) {
                        Image(systemName: "questionmark.circle")
                        Text("How to Use?")
                    }.foregroundColor(.green)
                }
                VSpacer(10)
            }
        }
    }
}
