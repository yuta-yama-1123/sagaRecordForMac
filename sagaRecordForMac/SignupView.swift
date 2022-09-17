import SwiftUI

struct SignupView: View {
  
  @Binding var isAuthenticated: Bool
  @Binding var isGoingToSignup: Bool
  
  @State var mailAddress: String = ""
  @State var password: String = ""
  
  var body: some View {
    VStack {
      Text("you are going to sign up")
      
      VStack {
        TextField("ログインID", text: $mailAddress)
          .frame(width: 300)
          .padding()
          .font(
            .system(size: 18, weight: .heavy, design: .rounded)
          )
        TextField("パスワード", text: $password)
          .frame(width: 300)
          .font(
            .system(size: 16, weight: .heavy, design: .rounded)
          )
      }
      .padding(EdgeInsets(top: 10, leading: 10, bottom: 40, trailing: 10))
      
      Button(action: {
        signup()
      }) {
        Text("ログイン")
          .font(
            .system(size: 16, weight: .heavy, design: .rounded)
          )
      }
    }
    .frame(width: 450, height: 400)
  }
  
  func signup() {
    print("signup!!")
    isGoingToSignup = false
  }
}

struct SignupView_Previews: PreviewProvider {
  
  @State static var isAuthenticated: Bool = false
  @State static var isGoingToSignUp: Bool = false
  
  static var previews: some View {
    SignupView(
      isAuthenticated: $isAuthenticated,
      isGoingToSignup: $isGoingToSignUp
    )
  }
}
