import Foundation
import SwiftUI

class ViewControllModel {
  private var selectedView: String = "0"
  
  enum distination: String {
    case topMenu = "0"
    case editStatus = "1"
    case searchStyles = "2"
    case editStyleList = "3"
    case editCharacterList = "4"
  }
  // ここに定義したメソッドを呼び出すことで各画面の表示/非表示をコントロールできるようにしたい
  func topMenu() {
    self.selectedView = distination.topMenu.rawValue
  }
  
  func editStatus() {
    self.selectedView = distination.editStatus.rawValue // ステータス更新
  }
  
  func searchStyles() {
    self.selectedView = distination.searchStyles.rawValue // スタイル一覧/検索
  }
  
  func editStyleList() {
    self.selectedView = distination.editStyleList.rawValue // スタイル登録
  }
  
  func editCharacterList() {
    self.selectedView = distination.editCharacterList.rawValue // キャラクター登録
  }
  
  func getSelectedView() -> String {
    return self.selectedView
  }
}
