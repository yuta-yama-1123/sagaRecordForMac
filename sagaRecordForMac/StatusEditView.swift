import SwiftUI

struct StatusEditView: View {
  @State var styleName: String = "test"
  var body: some View {
    HSplitView {
      VStack {
        // キャラの一覧を並べて表示したい。
        Button("テスト") {
          styleName = "ロマサガRSの育成アプリを作り隊！"
        }
      }
      .frame(width: 250, height: 600)
      
      VStack {
        // タブブラウザ的に編集中のスタイルを表示したい。
        Text(styleName)
          .padding()
        Link("Twitter本文埋め込み", destination: getNewTweetUrlWithTag())
          .padding()
      }
      .frame(width: 750, height: 600)
    }
  }
  
  func getNewTweetUrlWithTag() -> URL {
      //シェアするテキストを作成
      let text = "AppからTwitterでシェアする"
      let hashTag = "#ハッシュタグ"
      let completedText = text + "\n" + hashTag

      //作成したテキストをエンコード
      let encodedText = completedText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    
      //エンコードしたテキストをURLに繋げ、URLを開いてツイート画面を表示させる
      if let encodedText = encodedText {
        return URL(string: "https://twitter.com/intent/tweet?text=\(encodedText)")!
      }
    
    return URL(string: "https://twitter.com/")!
  }
}

struct StatusEditView_Previews: PreviewProvider {
    static var previews: some View {
        StatusEditView()
    }
}
