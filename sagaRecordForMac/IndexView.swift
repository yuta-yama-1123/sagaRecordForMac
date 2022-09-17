import SwiftUI

struct IndexView: View {
  @State var statusEdit: Bool = false
  @State var hover: Bool = false
  var body: some View {
    ZStack {
      if (statusEdit) {
        StatusEditView()
      } else {
        VStack {
          HStack {
            Button(action: {
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
              statusEdit = true
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
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    IndexView()
  }
}
