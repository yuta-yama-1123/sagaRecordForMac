import SwiftUI

struct SigninView: View {
  
  @Binding var isAuthenticated: Bool
  @Binding var isGoingToSignup: Bool
  
  @State var mailAddress: String = ""
  @State var password: String = ""
  
  var body: some View {
    VStack {
      Text("Welcome to SaGa Record for MAC")
        .padding()
        .font(
          .system(size: 22, weight: .heavy, design: .rounded)
        )
      
      VStack {
        TextField("サインインID", text: $mailAddress)
          .accessibility(identifier: "SigninID")
          .frame(width: 300)
          .padding()
          .font(
            .system(size: 18, weight: .heavy, design: .rounded)
          )
        TextField("パスワード", text: $password)
          .accessibility(identifier: "SigninPassword")
          .frame(width: 300)
          .font(
            .system(size: 16, weight: .heavy, design: .rounded)
          )
      }
      .padding(EdgeInsets(top: 10, leading: 10, bottom: 40, trailing: 10))
      
      Button(action: {
        signin()
      }) {
        Text("サインイン")
          .font(
            .system(size: 16, weight: .heavy, design: .rounded)
          )
      }
      .accessibility(identifier: "Signin")
      .buttonStyle(.borderless)
      .frame(width: 130, height: 45)
      .foregroundColor(Color.white)
      .background(Color.blue)
      .cornerRadius(10, antialiased: true)
      .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10))
      
      Button(action: {
        signup()
      }) {
        Text("新規に登録される場合はこちら")
          .font(
            .system(size: 14, weight: .heavy, design: .rounded)
          )
      }
      .buttonStyle(.borderless)
      .foregroundColor(Color.blue)
    }
    .frame(width: 450, height: 400)
  }
  
  func signin() {
    isAuthenticated = false
  }
  
  func signup() {
    isAuthenticated = false
    isGoingToSignup = true
  }
}

struct SigninView_Previews: PreviewProvider {
  
  @State static var isAuthenticated: Bool = false
  @State static var isGoingToSignUp: Bool = false
  
  static var previews: some View {
    SigninView(
      isAuthenticated: $isAuthenticated,
      isGoingToSignup: $isGoingToSignUp)
  }
}
