//
//  CenterModifier.swift
//  Animals-SwiftUI
//
//  Created by Ivan Nikitin on 15.07.2023.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
