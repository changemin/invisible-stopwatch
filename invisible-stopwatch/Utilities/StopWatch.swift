//
//  StopWatch.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/07.
//

import Foundation
import SwiftUI

struct Lap: Hashable{
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
    func recordLap() {
        if timeCount != 0 {
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
            lapList = []
            timeCount = 0
            timeString = "00:00:00"
        }
    }
    func generateTimeString() {
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
}
