//
//  Spacers.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/06.
//

import SwiftUI

struct VSpacer: View {
    @State private var amount: CGFloat
    var body: some View {
        Spacer().frame(height: amount)
    }
    init(_ amount: CGFloat) {
        self.amount = amount
    }
}

struct HSpacer: View {
    @State private var amount: CGFloat
    var body: some View {
        Spacer().frame(height: amount)
    }
    init(_ amount: CGFloat) {
        self.amount = amount
    }
}
