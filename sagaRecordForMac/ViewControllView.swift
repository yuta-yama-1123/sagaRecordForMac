//
//  ViewControllView.swift
//  sagaRecordForMac
//
//  Created by 山本祐太 on 2022/09/24.
//

import SwiftUI

struct ViewControllView: View {
  @State var viewControllModel = ViewControllModel()
  
  @Binding var statusEdit: Bool
  
  var body: some View {
    switch statusEdit {
      case true:
        StatusEditView()
    default:
      IndexView()
    }
  }
}

struct ViewControllView_Previews: PreviewProvider {
  @State static var statusEdit = true
  static var previews: some View {
    ViewControllView(statusEdit: $statusEdit)
  }
}
