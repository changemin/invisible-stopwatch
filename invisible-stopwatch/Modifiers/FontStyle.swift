//
//  FontStyle.swift
//  invisible-stopwatch
//
//  Created by 변경민 on 2021/06/06.
//

import SwiftUI

enum NanumFontWeight {
    case extraBold
    case light
    case bold
    case regular
    func getFontName() -> String {
        switch self {
        case .extraBold: return "NanumSquareRoundEB"
        case .bold: return "NanumSquareRoundB"
        case .light: return "NanumSquareRoundL"
        case .regular: return "NanumSquareRoundR"
        }
    }
}

extension Text {
    func timer() -> Text {
        self.nanumSquareR(size: 50, .bold, .black)
    }
    func caption() -> Text {
        self.nanumSquareR(size: 11, .regular, .gray)
            .foregroundColor(.gray)
    }
    func nanumSquareR(size: CGFloat, _ fontWeight: NanumFontWeight, _ color: Color) -> Text {
        self.font(Font.custom(fontWeight.getFontName(), size: size))
            .foregroundColor(color)
    }
}
