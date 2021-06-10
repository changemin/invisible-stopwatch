//
//  ContentView.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/06.
//

import SwiftUI
import MediaPlayer

struct ContentView: View {
    @State var invisibleMode: Bool = false
    @State var showHelp: Bool = false
    @State var showSettings: Bool = false
    @ObservedObject var stopWatch = StopWatch()
//    @ObservedObject private var volObserver = VolumeObserver()
    @Environment(\.horizontalSizeClass) var hSizeClass
    @State var previewVol: Float?
    init() {
//        previewVol = volObserver.volume
        if ProcessInfo.processInfo.arguments.contains("testingInvisibleMode") {
            _invisibleMode = .init(wrappedValue: true)
        }
    }

    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    GestureView(invisibleMode: $invisibleMode)
                        .environmentObject(stopWatch)
                        .id("GestureView")
                    VStack {
                        Spacer()
                        if showHelp {
                            VStack {
                                Text("1. Single Tap to Record Lap").caption()
                                Text("2. Double Tap to Start/Stop").caption()
                                Text("3. Long Press to Hide/Show").caption()
                                Text("4. Long Press on(or double tap) Timer to Reset").caption()
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
                                        .font(Font.system(size: 18, weight: .bold, design: .rounded))
                                    Text("How to Use?").nanumSquareR(size: 16, .regular, .divider)
                                }.foregroundColor(.divider)
                                .padding()
                            }
                            Spacer()
                            Button(action: {
                                self.showSettings.toggle()
                            }) {
                                HStack(spacing: 5) {
                                    Image(systemName: "gearshape.fill")
                                        .font(Font.system(size: 18, weight: .bold, design: .rounded))
                                }.foregroundColor(.divider)
                                .padding()
                            }
                        }
                        Spacer()
                    }
                }
            }
            .sheet(isPresented: self.$showSettings) {
                SettingView()
            }
            .navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
