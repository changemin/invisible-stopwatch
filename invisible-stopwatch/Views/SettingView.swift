//
//  SettingView.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/08.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Close").nanumSquareR(size: 16, .bold, .divider).padding()
                }
                Spacer()
            }
            ScrollView {
                Form {
                    Section {
                        Text("hello")
                    }
                }
            }
        }
    }
}
