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
      case ViewControllModel.distination.editStatus.rawValue:
        StatusEditView()
      case ViewControllModel.distination.searchStyles.rawValue:
        StyleSearchView()
      case ViewControllModel.distination.editStyleList.rawValue:
        StyleListEditView()
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
