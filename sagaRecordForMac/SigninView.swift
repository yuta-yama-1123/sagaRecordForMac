import SwiftUI
import PromiseKit

struct SigninView: View {
  
  var callApiModel = CallAPIModel()
  
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
        setConfigInfo()
      }) {
        Text("サインイン")
          .font(
            .system(size: 16, weight: .heavy, design: .rounded)
          )
      }
      .buttonStyle(BlueButton())
      .accessibility(identifier: "Signin")
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
    firstly {
      // 認証API呼び出し
      callApiModel.callTouchPost()
    }.done{ isSucceeded in
      if (isSucceeded) {
        isAuthenticated = false
      }
    }.catch { error in
      print(error)
      //result = "ログインに失敗しました"
      return
    }
  }
  
  func setConfigInfo() {
    firstly {
      callApiModel.callConfigInfoGet()
    }.done{ isSucceeded in
      if (isSucceeded) {
        //
      }
    }.catch { error in
      print(error)
      //result = "ログインに失敗しました"
      return
    }
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
