//
//  StopWatch.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/07.
//

import Foundation
import SwiftUI

struct Lap: Hashable {
    var idx: Int
    var split: String
    var time: String
}

class StopWatch: ObservableObject {
    @Published var lapList: [Lap] = []
    @Published var timeString: String = "00:00:00"
    @Published var isRunning: Bool = false
    @Published var timeCount = 0
    @Published var splitCount = 0
    var timer: Timer?
    init() {
        if ProcessInfo.processInfo.arguments.contains("testingGesture") {
            addDummyData()
        }
    }
    func recordLap() {
        if timeCount != 0 && splitCount != 0 {
            withAnimation(.spring()) {
                lapList.append(Lap(idx: lapList.count+1,
                                   split: generateTimeString(splitCount),
                                   time: generateTimeString(timeCount)))
            }
        }
        splitCount = 0
    }
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1,
                                      repeats: true,
                                      block: { (_) in
                                        self.timeCount += 1
                                        self.splitCount += 1
                                        self.generateTimeString()
                                      }
        )
        print("stopwatch started")
        self.isRunning = true
    }
    func pause() {
        timer!.invalidate()
        print("stopwatch pause")
        self.isRunning = false
    }
    func reset() {
        pause()
        withAnimation(.spring()) {
            lapList.removeAll()
            timeCount = 0
            splitCount = 0
            timeString = "00:00:00"
        }
    }
    func generateTimeString() {
        if timeCount >= 356400 {
            timeCount = 356400
            pause()
        }
        let seconds = timeCount%60
        let minutes = (timeCount/60)%60
        let hours = (timeCount/3600)%60
        self.timeString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    func generateTimeString(_ timeCount: Int) -> String {
        let seconds = timeCount%60
        let minutes = (timeCount/60)%60
        let hours = (timeCount/3600)%60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    func addDummyData() {
        self.timeString = "00:05:11"
        self.lapList.append(Lap(idx: 1, split: "00:00:50", time: "00:00:50"))
        self.lapList.append(Lap(idx: 2, split: "00:00:20", time: "00:01:10"))
        self.lapList.append(Lap(idx: 3, split: "00:00:13", time: "00:01:23"))
    }
}
