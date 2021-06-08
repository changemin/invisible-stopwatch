//
//  LapList.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/06.
//

import SwiftUI

struct LapList: View {
    @EnvironmentObject var stopWatch: StopWatch
    @Environment(\.horizontalSizeClass) var hSizeClass

    var body: some View {
        VStack {
            HStack {
                Text("No.").nanumSquareR(size: hSizeClass == .compact ? 15 : 20, .bold, .divider)
                Spacer()
                Text("Split").nanumSquareR(size: hSizeClass == .compact ? 15 : 20, .bold, .divider)
                Spacer()
                Text("Total").nanumSquareR(size: hSizeClass == .compact ? 15 : 20, .bold, .divider)
            }
            ScrollView(showsIndicators: false) {
                VStack(spacing: 6) {
                    ForEach(stopWatch.lapList.reversed(), id: \.self) { lap in
                        VStack {
                            HStack {
                                Text("#\(lap.idx)")
                                Spacer()
                                Text("\(lap.split)")
                                Spacer()
                                Text("\(lap.time)")
                            }
                            Divider()
                        }
                    }
                }
            }.allowsHitTesting(false)
        }
    }
}
