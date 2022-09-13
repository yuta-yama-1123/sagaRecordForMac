import SwiftUI

struct IndexView: View {
  @State var statusEdit: Bool = false
  var body: some View {
    ZStack {
      if (statusEdit) {
        StatusEditView()
      } else {
        VStack {
          Text("Hello, World!")
          Button("toStatusEdit") {
            statusEdit = true
          }
        }
      }
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    IndexView()
  }
}
