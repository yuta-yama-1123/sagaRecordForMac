import SwiftUI

struct IndexView: View {
  @State var viewControllModel = ViewControllModel()
  
  @State var statusEdit: Bool = false
  @State var hover: Bool = false
  @State var viewStatus: String = "0"
  var body: some View {
    ZStack {
      if (statusEdit) {
        ViewControllView(statusEdit: $statusEdit)
      } else {
        VStack {
          HStack {
            Button(action: {
              viewControllModel.editStatus()
              statusEdit = true
            }) {
              if (hover) {
                Image("505x305_2")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .scaledToFill()
                  .frame(width: 505, height: 305)
                  .blur(radius: 1.0)
                  .overlay(alignment: .topTrailing) {
                    Text("ステータス更新")
                      .font(
                        .system(size: 50, weight: .heavy, design: .rounded)
                      )
                      .foregroundColor(.black)
                      .padding()
                  }
              } else {
                Image("505x305_1")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .scaledToFill()
                  .frame(width: 505, height: 305)
                  .blur(radius: 1.0)
                  .overlay(alignment: .topTrailing) {
                    Text("ステータス更新")
                      .font(
                        .system(size: 50, weight: .heavy, design: .rounded)
                      )
                      .foregroundColor(.black)
                      .padding()
                  }
              }
            }
              .accessibility(identifier: "EditStatus")
              .buttonStyle(PlainButtonStyle())
              .frame(width: 505, height: 305)
              .padding(
                EdgeInsets(
                  top: 0, leading: 0, bottom: 0, trailing: 0
                )
              )
              .offset(x: 0, y: 0)
              .onHover { hovering in
                hover = hovering
              }
            
            Button(action: {
              statusEdit = true
            }) {
              Text("所持スタイル登録")
                .font(
                  .system(size: 50, weight: .heavy, design: .rounded)
                )
                .frame(width: 505, height: 305)
                .foregroundColor(Color.white)
                .background(.blue)
              }
                .buttonStyle(PlainButtonStyle())
                .padding(
                  EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .offset(x: -5, y: 0)
          }
          HStack {
            Button(action: {
              statusEdit = true
            }) {
              Text("スタイル一覧/検索")
                .font(
                  .system(size: 50, weight: .heavy, design: .rounded)
                )
                .frame(width: 505, height: 305)
                .foregroundColor(Color.white)
                .background(.blue)
              }
                .buttonStyle(PlainButtonStyle())
                .offset(x: 0, y: -5)
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
