//
//  TimerView.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/06.
//

import SwiftUI

struct TimerText: View {
    @Binding var invisibleMode: Bool
    @EnvironmentObject var stopWatch: StopWatch
    private var opacity: Double = 0.2
    private var width: CGFloat = 35
    private var height: CGFloat = 50
    var body: some View {
        ZStack {
            if invisibleMode {
                HStack(spacing: 0) {
                    ForEach(1...8, id: \.self) { char in
                        if char == 3 || char == 6 {
                            HSpacer(10)
                        } else {
                            Text(stopWatch.timeString[char-1..<char]).timer().redacted(reason: .placeholder)
                        }
                    }
                }
            } else {
                HStack(spacing: 0) {
                    ForEach(1...8, id: \.self) { char in
                        Text(stopWatch.timeString[char-1..<char]).timer()
                    }
                }
            }
        }.onLongPressGesture {
            stopWatch.reset()
        }
    }
    init(invisibleMode: Binding<Bool>) {
        self._invisibleMode = invisibleMode
    }
}
