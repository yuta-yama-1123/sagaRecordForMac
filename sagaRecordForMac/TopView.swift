import SwiftUI

struct TopView: View {
  // ログイン成否
  @State var isAuthenticated: Bool = true
  
  var body: some View {
    VStack {
      IndexView().sheet(isPresented: $isAuthenticated) {
        SigninView(isAuthenticated: $isAuthenticated)
      }
    }
    .frame(width: 1000, height: 600)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      TopView()
    }
}
