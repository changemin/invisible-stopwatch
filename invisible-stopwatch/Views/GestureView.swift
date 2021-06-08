//
//  GestureView.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/06.
//

import SwiftUI

struct GestureView: View {
    @Binding var invisibleMode: Bool
    @EnvironmentObject var stopWatch: StopWatch
    var body: some View {
        GeometryReader { _ in
            Rectangle()
                .fill(Color.backgroundColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        }
        .highPriorityGesture(TapGesture(count: 2).onEnded {
            print("double clicked")
            if stopWatch.isRunning {
                stopWatch.pause()
            } else {
                stopWatch.start()
            }
        })
        .gesture(TapGesture().onEnded {
            print("single clicked")
            stopWatch.recordLap()
        })
        .onLongPressGesture {
            print("Long")
            withAnimation { self.invisibleMode.toggle() }
        }
    }
}
