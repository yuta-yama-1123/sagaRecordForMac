import SwiftUI
import PromiseKit

struct CharacterSearchView: View {
  var constantValueModel = ConstantValuesModel()
  var callApiModel = CallAPIModel()
  
  @State var checked: [String] = []
  @State var checked2: [String] = []
  var body: some View {
    VStack {
      Text("CharacterSearchView")
      
      Text("シリーズ")
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(constantValueModel.series, id: \.id) { index in
            HStack {
              Image(systemName: checked.contains(where: { $0 == index.name }) ? "checkmark.square" : "square")
                .onTapGesture {
                  check(name: index.name)
                }
              Text(index.name)
            }
            .frame(width: 70)
          }
        }
      }
      .frame(width: 800)
      .padding()
      
      Text("武器種")
      ScrollView(.horizontal) {
        HStack {
          ForEach(constantValueModel.weapon, id: \.id) { index in
            HStack {
              Image(systemName: checked2.contains(where: { $0 == index.name }) ? "checkmark.square" : "square")
                .onTapGesture {
                  check2(name: index.name)
                }
              Text(index.displayName)
            }
            .frame(width: 70)
          }
        }
      }
      .frame(width: 800)
      .padding()
      
      Text(checked.description)
      Text(checked2.description)
      
      Button(action: {
        print("searchStyles")
        select(checked: checked, checked2: checked2)
      }) {
        Text("検索")
          .font(
            .system(size: 16, weight: .heavy, design: .rounded)
          )
      }
      .buttonStyle(BlueButton())
      .accessibility(identifier: "Signin")
      .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10))
    }
  }
  
  func check(name: String) {
    if (checked.contains(where: { $0 == name })) {
      print("remove")
      checked.removeAll(where: { $0 == name })
    } else {
      print("append")
      checked += [name]
    }
  }
  
  func check2(name: String) {
    if (checked2.contains(where: { $0 == name })) {
      print("remove")
      checked2.removeAll(where: { $0 == name })
    } else {
      print("append")
      checked2 += [name]
    }
  }
  
  func select(checked: [String], checked2: [String]) {
    firstly {
      // 認証API呼び出し
      callApiModel.callSelectStylesPost(series: checked, weapon: checked2)
    }.done{ isSucceeded in
      if (isSucceeded) {
        print("OK!")
      }
    }.catch { error in
      print(error)
      //result = "ログインに失敗しました"
      return
    }
  }
}

struct CharacterSearchView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterSearchView()
    }
}
