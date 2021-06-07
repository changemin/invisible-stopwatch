//
//  StopWatch.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/07.
//

import Foundation

struct Lap {
    var idx: Int
    var timeString: String
}

class StopWatch {
    @Published var lap: [Lap] = []
    @Published var timeString: String = "00:00:00"

    func recordLap() {
        
    }
    func start() {
        
    }
    func pause() {
        
    }
    func reset() {
        
    }
}
