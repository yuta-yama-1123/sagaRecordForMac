//
//  ViewControllView.swift
//  sagaRecordForMac
//
//  Created by 山本祐太 on 2022/09/24.
//

import SwiftUI

struct ViewControllView: View {
  @State var viewControllModel = ViewControllModel()
  
  @Binding var viewStatus: String
  
  var body: some View {
    switch viewStatus {
      case ViewControllModel.distination.editStatus.rawValue: // ステータス更新
        StatusEditView()
      case ViewControllModel.distination.searchStyles.rawValue: // スタイル一覧/検索
        StyleSearchView()
      case ViewControllModel.distination.editStyleList.rawValue: // スタイル登録
        StyleListEditView()
      case ViewControllModel.distination.editCharacterList.rawValue: // スタイル登録
        CharacterSearchView()
    default:
      IndexView()
    }
  }
}

struct ViewControllView_Previews: PreviewProvider {
  @State static var viewStatus = "1"
  static var previews: some View {
    ViewControllView(viewStatus: $viewStatus)
  }
}
