import Foundation
import SwiftUI

class ViewControllModel {
  @State var selectedView: String = ""
  
  // ここに定義したメソッドを呼び出すことで各画面の表示/非表示をコントロールできるようにしたい
  func editStatus() {
    selectedView = "1"
  }
  
  func searchStyles() {
    selectedView = "2"
  }
  
  func listStyles() {
    selectedView = "3"
  }
}
