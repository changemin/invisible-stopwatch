//
//  SettingView.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/08.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            Text("Setting")
            .navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
