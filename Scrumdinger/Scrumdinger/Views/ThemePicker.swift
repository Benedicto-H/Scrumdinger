//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by 홍진표 on 2023/06/03.
//

import SwiftUI

struct ThemePicker: View {
    
    // MARK: - State Binding-Prop
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
