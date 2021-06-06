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
                Text("00:00:00").timer()
                VSpacer(30)

                if showHelp {
                    VStack {
                        Text("1. Single Tap to Record Lap").caption()
                        Text("2. Double Tap to Start/Stop").caption()
                        Text("3. Triple Tap to Hide/Show").caption()
                        Text("4. Long Press to Open Settings").caption()
                    }
                }
            }
            VStack {
                Spacer()
                Button(action: {
                    withAnimation { showHelp.toggle() }
                }) {
                    Text("How to Use?")
                }
                VSpacer(20)
            }
        }
    }
}
