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
    var timer = Timer.scheduledTimer(withTimeInterval: 1,
                                     repeats: true,
                                     block: { (_) in
                                        self.everySecond()
                                     }
    )
//    @Published var _ = T
    func recordLap() {
//        lapList.append(<#T##newElement: Lap##Lap#>)
//        scheduled
    }
    func start() {
        print("stopwatch started")
        self.isRunning = true
    }
    func pause() {
        print("stopwatch pause")
        self.isRunning = false
    }
    func reset() {
        lapList = []
        timeString = "00:00:00"
    }
    func everySecond() {
        self.timeCount += 1
        print(self.timeCount)
    }
}
