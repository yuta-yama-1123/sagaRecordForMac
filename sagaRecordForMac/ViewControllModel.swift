import Foundation
import SwiftUI

class ViewControllModel {
  private var selectedView: String = "0"
  
  enum distination: String {
    case topMenu = "0"
    case editStatus = "1"
    case searchStyles = "2"
  }
  // ここに定義したメソッドを呼び出すことで各画面の表示/非表示をコントロールできるようにしたい
  func topMenu() {
    self.selectedView = distination.topMenu.rawValue
  }
  
  func editStatus() {
    self.selectedView = distination.editStatus.rawValue
  }
  
  func searchStyles() {
    self.selectedView = distination.searchStyles.rawValue
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
