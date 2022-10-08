//
//  CustomSubmitButton.swift
//  sagaRecordForMac
//
//  Created by 山本祐太 on 2022/10/08.
//

import SwiftUI

struct BlueButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .buttonStyle(.borderless)
      .frame(width: 130, height: 45)
      .foregroundColor(Color.white)
      .background(Color.blue)
      .cornerRadius(10, antialiased: true)
  }
}
