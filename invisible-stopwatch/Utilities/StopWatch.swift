//
//  StopWatch.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/07.
//

import Foundation
import SwiftUI

struct Lap {
    var idx: Int
    var timeString: String
}

class StopWatch: ObservableObject {
    @Published var lapList: [Lap] = []
    @Published var timeString: String = "00:00:00"
    @Published var isRunning: Bool = false
    @Published var timeCount = 0
    var timer: Timer?
//    @Published var _ = T
//    init() {
//        timer
//    }
    func recordLap() {
//        lapList.append(<#T##newElement: Lap##Lap#>)
//        scheduled
    }
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.001,
                                      repeats: true,
                                      block: { (_) in
                                        self.timeCount += 1
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
        lapList = []
        timeCount = 0
        timeString = "00:00:00"
        
    }
    func generateTimeString() {
        let seconds = timeCount%60
        let minutes = (timeCount/60)%60
        let hours = (timeCount/3600)%60
        self.timeString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        print(String(format: "%02d:%02d:%02d", hours, minutes, seconds))
    }
}
