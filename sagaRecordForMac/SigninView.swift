import SwiftUI

struct SigninView: View {
  @Binding var isAuthenticated: Bool
  var body: some View {
    VStack {
      Text("Hello, world!")
          .padding()
      Button(action: {
        login()
      }) {
        Text("ログイン")
      }
    }
    .frame(width: 250, height: 250)
  }
  
  func login() {
    isAuthenticated = false
  }
}

struct SigninView_Previews: PreviewProvider {
  @State static var isAuthenticated: Bool = false
  static var previews: some View {
    SigninView(isAuthenticated: $isAuthenticated)
  }
}
