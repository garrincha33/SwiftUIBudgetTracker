//
//  PlaceHolderColorChange.swift
//  SwiftUIIRichyExpenses
//
//  Created by Richard Price on 08/06/2022.
//

import Foundation
import SwiftUI

//MARK: - modifier for changing the color of placeholder
public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                .padding(.horizontal, 5)
                .foregroundColor(.gray)
            }
            content
            .foregroundColor(Color("Gray2"))
            .padding(5.0)
        }
    }
}
