//
//  GestureView.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/06.
//

import SwiftUI

struct GestureView: View {
    @Binding var invisibleMode: Bool
    var body: some View {
        GeometryReader { _ in
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .opacity(invisibleMode ? 1 : 0)
        }.onTapGesture {
            withAnimation { self.invisibleMode.toggle() }
        }
    }
}
