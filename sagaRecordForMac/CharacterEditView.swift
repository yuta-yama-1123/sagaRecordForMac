//
//  CharacterEditView.swift
//  sagaRecordForMac
//
//  Created by 山本祐太 on 2022/10/21.
//

import SwiftUI

struct CharacterEditView: View {
  
  var constantValueModel = ConstantValuesModel()
  
  @Binding var editingCharacter: Bool
  
  @State var name: String = ""
  @State var series: ConstantValuesModel.Series = ConstantValuesModel.Series("")
  @State var gender: String = ""
  
  var body: some View {
    VStack {
      Text("キャラクター編集")
      
      TextField("キャラクター名", text: $name)
        .accessibility(identifier: "name")
        .frame(width: 300)
        .padding()
        .font(
          .system(size: 18, weight: .heavy, design: .rounded)
        )
      
      TextField("シリーズ", text: $series.name)
        .accessibility(identifier: "name")
        .frame(width: 300)
        .padding()
        .font(
          .system(size: 18, weight: .heavy, design: .rounded)
        )
      
      Picker("seriesSelect", selection: $series.id) {
        ForEach(constantValueModel.series) { series in
          Text(series.name)
        }
        .pickerStyle(.menu)
      }
      .frame(width: 300)
      .padding()
      
      Text("選択値：\(series.id)")
      
      TextField("性別", text: $gender)
        .accessibility(identifier: "gender")
        .frame(width: 300)
        .padding()
        .font(
          .system(size: 18, weight: .heavy, design: .rounded)
        )
      
      Button(action: {
        close()
      }) {
        Text("閉じる")
          .font(
            .system(size: 16, weight: .heavy, design: .rounded)
          )
      }
      .buttonStyle(BlueButton())
      .accessibility(identifier: "Close")
      .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10))
    }
  }
  
  func close() {
    editingCharacter = false
  }
}

struct CharacterEditView_Previews: PreviewProvider {
  @State static var editingCharacter: Bool = false
  
  static var previews: some View {
    CharacterEditView(editingCharacter: $editingCharacter)
  }
}
