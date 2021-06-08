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
    @ObservedObject var stopWatch = StopWatch()
    @Environment(\.horizontalSizeClass) var hSizeClass

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    GestureView(invisibleMode: $invisibleMode)
                        .environmentObject(stopWatch)
                    VStack {
                        Spacer()
                        if showHelp {
                            VStack {
                                Text("1. Single Tap to Record Lap").caption()
                                Text("2. Double Tap to Start/Stop").caption()
                                Text("3. Long Press to Hide/Show").caption()
                                Text("4. Long Press on Timer to Reset").caption()
                            }
                        }
                        VSpacer(10)
                        TimerText(invisibleMode: $invisibleMode)
                            .environmentObject(stopWatch)
                            .padding(.bottom, invisibleMode ? geo.size.height*0.5 : 0)
                        if !invisibleMode {
                            LapList()
                                .frame(width: hSizeClass == .regular ? geo.size.width*0.3 : geo.size.width*0.7, height: geo.size.height*0.7)
                                .environmentObject(stopWatch)
                        }
                    }
                    VStack {
                        HStack {
                            Button(action: {
                                withAnimation(.spring()) { showHelp.toggle() }
                            }) {
                                HStack(spacing: 5) {
                                    Image(systemName: "questionmark.circle")
                                        .font(Font.system(size: 15, weight: .bold, design: .rounded))
                                    Text("How to Use?").nanumSquareR(size: 15, .regular, .green)
                                }.foregroundColor(.green)
                                .padding()
                            }
                            Spacer()
                            NavigationLink(destination: SettingView()) {
                                HStack(spacing: 5) {
                                    Image(systemName: "gearshape.fill")
                                        .font(Font.system(size: 15, weight: .bold, design: .rounded))
                                }.foregroundColor(.green)
                                .padding()
                            }
                        }
                        Spacer()
                    }
                }
            }
            .navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
