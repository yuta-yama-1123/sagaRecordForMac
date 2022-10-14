import SwiftUI
import PromiseKit

struct SignupView: View {
  // API処理モデル
  var callApiModel = CallAPIModel()
  
  @Binding var isAuthenticated: Bool
  @Binding var isGoingToSignup: Bool
  
  @State var loginId: String = ""
  @State var mailAddress: String = ""
  @State var password: String = ""
  @State var passwordConfirm: String = ""
  
  var body: some View {
    VStack {
      Text("you are going to sign up")
        .padding()
        .font(
          .system(size: 22, weight: .heavy, design: .rounded)
        )
      
      VStack {
        TextField("ログインID", text: $loginId)
          .frame(width: 300)
          .padding()
          .font(
            .system(size: 18, weight: .heavy, design: .rounded)
          )
        TextField("メールアドレス", text: $mailAddress)
          .frame(width: 300)
          .padding()
          .font(
            .system(size: 18, weight: .heavy, design: .rounded)
          )
        TextField("パスワード", text: $password)
          .frame(width: 300)
          .padding()
          .font(
            .system(size: 16, weight: .heavy, design: .rounded)
          )
        TextField("パスワード（再入力）", text: $passwordConfirm)
          .frame(width: 300)
          .padding()
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
      .buttonStyle(BlueButton())
      .accessibility(identifier: "Signin")
    }
    .frame(width: 450, height: 500)
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
        isAuthenticated = true
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
