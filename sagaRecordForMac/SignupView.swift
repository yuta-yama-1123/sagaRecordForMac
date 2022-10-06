import SwiftUI
import PromiseKit

struct SignupView: View {
  // API処理モデル
  var callApiModel = CallAPIModel()
  
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
        Text("サインアップ")
          .font(
            .system(size: 16, weight: .heavy, design: .rounded)
          )
      }
    }
    .frame(width: 450, height: 400)
  }
  
  func signup() {
    print("signup!!")
    firstly {
      // サインアップAPI呼び出し
      callApiModel.callSignupPost(
        name: "name",
        mailAddress: "test",
        password: "test"
      )
    }.done { loggedIn in
      if (loggedIn) {
        isGoingToSignup = false
      }
    }.catch { error in
      print(error)
      //result = "ログインに失敗しました"
    }
  }
  
  func validation() {
    print("validation")
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
