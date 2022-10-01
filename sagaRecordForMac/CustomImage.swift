//
//  CustomImage.swift
//  sagaRecordForMac
//
//  Created by 山本祐太 on 2022/10/01.
//

import SwiftUI

struct CustomImage: View {
  @State var fileName: String
  @State var overlayText: String
  
  var body: some View {
    Image(fileName)
      .resizable()
      .aspectRatio(contentMode: .fill)
      .scaledToFill()
      .frame(width: 505, height: 305)
      .blur(radius: 1.0)
      .overlay(alignment: .topTrailing) {
        Text(overlayText)
          .font(
            .system(size: 50, weight: .heavy, design: .rounded)
          )
          .foregroundColor(.black)
          .padding()
      }
  }
}

struct CustomImage_Previews: PreviewProvider {
  @State static var fileName = ""
  @State static var overlayText = ""
  
  static var previews: some View {
    CustomImage(fileName: fileName, overlayText: overlayText)
  }
}
