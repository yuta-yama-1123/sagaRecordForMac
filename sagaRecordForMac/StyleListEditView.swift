import SwiftUI

struct StyleListEditView: View {
  var constantValueModel = ConstantValuesModel()
  
  @State var checked: [String] = []
  @State var checked2: [String] = []
  var body: some View {
    VStack {
      Text("ListEditView")
      
      // 検索条件の項目をうまく表示したい。（スクロールできないのが問題点）
      ItemList(items: (0..<100).map { ItemData(index: $0) })
          .frame(height: 100)
//      GeometryReader { geo in
//        List(constantValueModel.series, id: \.id) { index in
//            ItemRow
//              Image(systemName: checked.contains(where: { $0 == index.name }) ? "checkmark.square" : "square")
//                .onTapGesture {
//                  check(name: index.name)
//                }
//              Text(index.name)
//            }
//        }
//        .frame(width: geo.size.height, height: geo.size.width)
//        .rotationEffect(.degrees(-90), anchor: .bottomLeading)
//        .transformEffect(.init(translationX: geo.size.width, y: 0))
//      }
//
//      List() {
//        ForEach(constantValueModel.weapon, id: \.id) { index in
//          HStack {
//            Image(systemName: checked2.contains(where: { $0 == index.name }) ? "checkmark.square" : "square")
//              .onTapGesture {
//                check2(name: index.name)
//              }
//            Text(index.name)
//          }
//        }
//      }
//      .rotationEffect(.degrees(-90), anchor: .bottomLeading)
      
      Text(checked.description)
      Text(checked2.description)
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
}

struct ItemData {
    var index = 0
    var check = false
}

struct ItemList: View {
    @State var items: [ItemData]

    var body: some View {
        GeometryReader { geo in
            List(0..<items.count) { i in
                ItemRow(item: $items[i])
                    .frame(height: 100)
                    .contentShape(Rectangle())
            }
            .frame(width: geo.size.height, height: geo.size.width)
            .rotationEffect(.degrees(-90), anchor: .bottomLeading)
            .transformEffect(.init(translationX: geo.size.width, y: 0))
            .scaleEffect(x: 1, y: -1)
        }
    }
}

struct ItemRow: View {
    @Binding var item: ItemData

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.blue.opacity(item.check ? 0.5 : 0.3)
                    .cornerRadius(8)
                Text("\(item.index)")
            }
            .frame(width: geo.size.height, height: geo.size.width)
            .rotationEffect(.degrees(90), anchor: .topTrailing)
            .transformEffect(.init(translationX: 0, y: geo.size.height))
            .scaleEffect(x: -1, y: 1)
            .onTapGesture {
                item.check.toggle()
            }
        }
    }
}
struct StyleListEditView_Previews: PreviewProvider {
    static var previews: some View {
        StyleListEditView()
    }
}
