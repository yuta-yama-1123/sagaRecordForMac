import SwiftUI

struct TopView: View {
  // ログイン成否
  @State var isAuthenticated: Bool = true
  @State var isGoingToSignup: Bool = false
  
  var body: some View {
    VStack {
      IndexView()
        .sheet(isPresented: $isAuthenticated) {
          SigninView(isAuthenticated: $isAuthenticated, isGoingToSignup: $isGoingToSignup)
        }
        .sheet(isPresented: $isGoingToSignup) {
          SignupView(isAuthenticated: $isAuthenticated, isGoingToSignup: $isGoingToSignup)
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
