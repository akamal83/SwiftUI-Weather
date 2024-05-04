//
//  MainButton.swift
//  SwiftUI-Weather
//
//  Created by Ahmed Kamal on 04/05/2024.
//

import SwiftUI

struct MainButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .medium, design: .default))
            .cornerRadius(10)
    }
}

struct MainButton_Preview: PreviewProvider {
    static var previews: some View {
        MainButton(title: "Test title", textColor: .white, backgroundColor: .blue)
    }
}
