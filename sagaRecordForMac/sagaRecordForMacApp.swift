import SwiftUI

@main
struct sagaRecordForMacApp: App {
  // ウィンドウタイトル
  let windowTitle: String = "SaGa Record for MAC"
  
  var body: some Scene {
    WindowGroup {
      // 入口はログイン画面
      TopView()
        .navigationTitle(windowTitle)
    }
  }
}
