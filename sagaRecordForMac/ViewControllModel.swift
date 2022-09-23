import Foundation
import SwiftUI

class ViewControllModel {
  private var selectedView: String = "0"
  
  // ここに定義したメソッドを呼び出すことで各画面の表示/非表示をコントロールできるようにしたい
  func topMenu() {
    self.selectedView = "0"
  }
  
  func editStatus() {
    self.selectedView = "1"
  }
  
  func searchStyles() {
    self.selectedView = "2"
  }
  
  func listStyles() {
    self.selectedView = "3"
  }
  
  func selectView4() {
    self.selectedView = "4"
  }
  
  func getSelectedView() -> String {
    return self.selectedView
  }
}
