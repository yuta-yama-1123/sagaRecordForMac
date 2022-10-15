import SwiftUI

struct StyleListEditView: View {
  @State var items = [
      Item("apple"), Item("banana"), Item("orange")]
  @State var checked: [String] = []
  var body: some View {
    VStack {
      Text("ListEditView")
      List() {
        ForEach(0 ..< items.count) { index in
          HStack {
            Image(systemName: items[index].isChecked ? "checkmark.square" : "square")
              .onTapGesture {
                items[index].isChecked.toggle()
                check(index: index)
              }
            Text(items[index].name)
          }
        }
      }
      Text(checked.description)
    }
  }
  
  func check(index: Int) {
    if (checked.contains(where: { $0 == String(index) })) {
      print("remove")
      checked.removeAll(where: { $0 == String(index) })
    } else {
      print("append")
      checked += [String(index)]
    }
  }
}

struct Item {
    var isChecked: Bool
    var name: String
    
    init(_ name: String) {
        self.isChecked = false
        self.name = name
    }
}

struct StyleListEditView_Previews: PreviewProvider {
    static var previews: some View {
        StyleListEditView()
    }
}
