//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/01.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    
    // MARK: - LabelStyle Method (Required)
    func makeBody(configuration: Configuration) -> some View {
        
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    /// `LabelStyle Protocol`을 Adopted한 Type중에서 현재 Type인 `Self`가 `TrailingIconLabelStyle` Type과 동일한 경우에만 Extension 된다.
    ///
    /// `where`절 사용 용도
    /// 1. Patter과 결합하여 조건 추가
    /// 2. Type에 대한 Constraints 추가
    
    // MARK: - Singleton Instance
    static var trailingIcon: Self {
        
        get {
            return Self()
        }
    }
}
