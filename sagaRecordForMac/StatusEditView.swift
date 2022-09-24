import SwiftUI

struct StatusEditView: View {
  @State var styleName: String = "test"
  
  @State var status1: String = ""
  @State var status2: Int = 0
  struct Character {
    var id: String
    var name: String
    var status1: Int
  }
  let characters: [Character] = [
    Character(
      id: "1",
      name: "名前１",
      status1: 100
    ),
    Character(
      id: "2",
      name: "名前２",
      status1: 120
    )
  ]
  var body: some View {
    HSplitView {
      VStack {
        List {
          ForEach(characters, id: \.self.id) { entry in
            HStack {
              Text(entry.id)
                .padding()
                .lineLimit(2)
              Text(entry.name)
                .lineLimit(2)
            }.onTapGesture {
              editStatus(character: entry)
            }
          }
          .onMove { indices, destination in
              // TODO: update items array accordingly
          }
        }

        // キャラの一覧を並べて表示したい。
        Button("テスト") {
          styleName = "ロマサガRSの育成アプリを作り隊！"
        }
      }
      .frame(width: 250, height: 600)
      
      VStack {
        // タブブラウザ的に編集中のスタイルを表示したい。
        Text(styleName)
          .accessibility(identifier: "TargetStyleName")
          .padding()
        Link("Twitter本文埋め込み", destination: getNewTweetUrlWithTag())
          .padding()
        Text("ステータス更新")
        Group {
          StatusStepperView(title: "腕力", param: status2)
          StatusStepperView(title: "体力", param: status2)
          StatusStepperView(title: "器用さ", param: status2)
          StatusStepperView(title: "素早さ", param: status2)
          StatusStepperView(title: "知力", param: status2)
          StatusStepperView(title: "精神", param: status2)
          StatusStepperView(title: "愛", param: status2)
          StatusStepperView(title: "魅力", param: status2)
        }
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
  
  func editStatus(character: Character) {
    self.styleName = character.name
    self.status1 = String(character.status1)
  }
}

struct StatusEditView_Previews: PreviewProvider {
    static var previews: some View {
        StatusEditView()
    }
}
