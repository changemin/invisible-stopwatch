//
//  TimerView.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/06.
//

import SwiftUI

struct Timer: View {
    @Binding var invisibleMode: Bool
    private var opacity: Double = 0.2
    private var width: CGFloat = 35
    private var height: CGFloat = 50
    var body: some View {
        ZStack {
            if invisibleMode {
                HStack(spacing: 15) {
                    ForEach(1...3, id: \.self) { _ in
                        HStack {
                            ForEach(1...2, id: \.self) { _ in
                                Rectangle()
                                    .fill(Color.textColor.opacity(opacity)).frame(width: width, height: height)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            } else {
                Text("00:00:00").timer()
            }
        }
    }
    init(invisibleMode: Binding<Bool>) {
        self._invisibleMode = invisibleMode
    }
}
