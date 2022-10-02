import SwiftUI

struct IndexView: View {
  @State var viewControllModel = ViewControllModel()
  
  @State var statusEdit: Bool = false
  @State var hover1: Bool = false
  @State var hover2: Bool = false
  @State var hover3: Bool = false
  @State var viewStatus: String = "0"
  
  var body: some View {
    ZStack {
      if (viewStatus != "0") {
        ViewControllView(viewStatus: $viewStatus)
      } else {
        VStack {
          HStack {
            Button(action: {
              viewControllModel.editStatus()
              viewStatus = viewControllModel.getSelectedView()
            }) {
              if (hover1) {
                CustomImage(fileName: "505x305_2", overlayText: "ステータス更新")
              } else {
                CustomImage(fileName: "505x305_1", overlayText: "ステータス更新")
              }
            }
              .accessibility(identifier: "EditStatus")
              .buttonStyle(PlainButtonStyle())
              .frame(width: 505, height: 305)
              .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
              .offset(x: 0, y: 0)
              .onHover { hovering in
                hover1 = hovering
              }
            
            Button(action: {
              viewControllModel.editStyleList()
              viewStatus = viewControllModel.getSelectedView()
            }) {
              if (hover2) {
                CustomImage(fileName: "505x305_2", overlayText: "所持スタイル登録")
              } else {
                CustomImage(fileName: "505x305_1", overlayText: "所持スタイル登録")
              }
            }
              .accessibility(identifier: "EditStyleList")
              .buttonStyle(PlainButtonStyle())
              .frame(width: 505, height: 305)
              .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
              .offset(x: -5, y: 0)
              .onHover { hovering in
                hover2 = hovering
              }
          }
          HStack {
            Button(action: {
              viewControllModel.searchStyles()
              viewStatus = viewControllModel.getSelectedView()
            }) {
              if (hover3) {
                CustomImage(fileName: "505x305_2", overlayText: "スタイル一覧/検索")
              } else {
                CustomImage(fileName: "505x305_1", overlayText: "スタイル一覧/検索")
              }
            }
              .accessibility(identifier: "SearchStyle")
              .buttonStyle(PlainButtonStyle())
              .frame(width: 505, height: 305)
              .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
              .offset(x: 0, y: -5)
              .onHover { hovering in
                hover3 = hovering
              }
            
            Button(action: {
              viewControllModel.selectView4()
            }) {
              Text("その他の何か")
                .font(
                  .system(size: 50, weight: .heavy, design: .rounded)
                )
                .frame(width: 505, height: 305)
                .foregroundColor(Color.white)
                .background(.blue)
              }
                .buttonStyle(PlainButtonStyle())
                .offset(x: -5, y: -5)
          }
        }
      }
    }
  }
  
  func testPrint() {
    print("testPrint")
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    IndexView()
  }
}
