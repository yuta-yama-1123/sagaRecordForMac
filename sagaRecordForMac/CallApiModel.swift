//
//  CallApiModel.swift
//  sagaRecordForMac
//
//  Created by 山本祐太 on 2022/09/25.
//

import Foundation
import Alamofire
import PromiseKit

class CallAPIModel {
  var constantValueModel = ConstantValuesModel()
  var userDefaultsModel = UserDefaultsModel()
  
  let headers: HTTPHeaders = [
    "Content-Type":"application/x-www-form-urlencoded; charset=UTF-8"
  ]
  
  // とりあえずテスト用
  func callTouchPost()  -> Promise<Bool> {
    return Promise { resolver in
      let requestUrl = constantValueModel.apiDomain + "/touch"
      let param: Parameters = [
        "hoge": "fuga",
      ]
      AF // Alamofire
        .request(
          requestUrl,
          method: .post,
          parameters: param,
          encoding: URLEncoding.httpBody,
          headers: headers
        )
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData { response in
          switch response.result {
            case .success(let data):
              // レスポンス内容をログ出力
              print(String(data: data, encoding: .utf8)!)
              resolver.fulfill(true)
            case .failure(let error):
              print("error:\(error)")
              resolver.reject(error)
          }
        }
    }
  }
  
  // サインアップ
  func callSignupPost(
    name: String,
    mailAddress: String,
    password: String)  -> Promise<Bool> {
    return Promise { resolver in
      let requestUrl = constantValueModel.apiDomain + "/signup"
      let param: Parameters = [
        "name": name,
        "mailAddress": mailAddress,
        "password": password
      ]
      AF // Alamofire
        .request(
          requestUrl,
          method: .post,
          parameters: param,
          encoding: URLEncoding.httpBody,
          headers: headers
        )
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData { response in
          switch response.result {
            case .success(let data):
              // レスポンス内容をログ出力
              print(String(data: data, encoding: .utf8)!)
              resolver.fulfill(true)
            case .failure(let error):
              print("error:\(error)")
              resolver.reject(error)
          }
        }
    }
  }
  
  // サインイン
  func callSigninPost(
    mailAddress: String,
    password: String,
    keepLogin: Bool)  -> Promise<Bool> {
    return Promise { resolver in
      let requestUrl = constantValueModel.apiDomain + "/signin"
      let param: Parameters = [
        "mailAddress": mailAddress,
        "password": password,
        "keepLogin": keepLogin
      ]
      AF // Alamofire
        .request(
          requestUrl,
          method: .post,
          parameters: param,
          encoding: URLEncoding.httpBody,
          headers: headers
        )
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData { response in
          switch response.result {
            case .success(let data):
              // レスポンス内容をログ出力
              print(String(data: data, encoding: .utf8)!)
              resolver.fulfill(true)
            case .failure(let error):
              print("error:\(error)")
              resolver.reject(error)
          }
        }
    }
  }
  
  // スタイルデータ検索用
  func callSelectStylesPost(
    series: [String],
    weapon: [String])  -> Promise<Bool> {
    return Promise { resolver in
      let requestUrl = constantValueModel.apiDomain + "/character/select"
      let param: Parameters = [
        "series": series,
        "weapon": weapon
      ]
      AF // Alamofire
        .request(
          requestUrl,
          method: .post,
          parameters: param,
          encoding: URLEncoding.httpBody,
          headers: headers
        )
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData { response in
          switch response.result {
            case .success(let data):
              // レスポンス内容をログ出力
              print(String(data: data, encoding: .utf8)!)
              resolver.fulfill(true)
            case .failure(let error):
              print("error:\(error)")
              resolver.reject(error)
          }
        }
    }
  }
  
  // スタイルデータ検索用
  func callSelectAllStylesPost()  -> Promise<Bool> {
    return Promise { resolver in
      let requestUrl = constantValueModel.apiDomain + "/character/selectAll"
      AF // Alamofire
        .request(
          requestUrl,
          method: .post,
          encoding: URLEncoding.httpBody,
          headers: headers
        )
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData { response in
          switch response.result {
            case .success(let data):
              // レスポンス内容をログ出力
              print(String(data: data, encoding: .utf8)!)
              resolver.fulfill(true)
            case .failure(let error):
              print("error:\(error)")
              resolver.reject(error)
          }
        }
    }
  }
  
  // スタイルデータ更新用
  func callEditStylePost(
    name: String,
    mailAddress: String,
    password: String)  -> Promise<Bool> {
    return Promise { resolver in
      let requestUrl = constantValueModel.apiDomain + "/signup"
      let param: Parameters = [
        "name": name,
        "mailAddress": mailAddress,
        "password": password
      ]
      AF // Alamofire
        .request(
          requestUrl,
          method: .post,
          parameters: param,
          encoding: URLEncoding.httpBody,
          headers: headers
        )
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData { response in
          switch response.result {
            case .success(let data):
              // レスポンス内容をログ出力
              print(String(data: data, encoding: .utf8)!)
              resolver.fulfill(true)
            case .failure(let error):
              print("error:\(error)")
              resolver.reject(error)
          }
        }
    }
  }
  
  // GETお試し用
  func callTouchGet() -> Promise<Bool> {
    return Promise { resolver in
      let requestUrl = constantValueModel.apiDomain + "/getTest"
      let headers: HTTPHeaders = [
        "Content-Type":"application/x-www-form-urlencoded; charset=UTF-8"
      ]
      AF // Alamofire
        .request(
          requestUrl,
          method: .get,
          headers: headers
        )
        .validate(statusCode: 200..<300)
        .responseData { response in
          switch response.result {
          case .success(_):
            resolver.fulfill(true)
          case .failure(let error):
            resolver.reject(error)
          }
        }
    }
  }
  
  // GETお試し用
  func callConfigInfoGet() -> Promise<Bool> {
    return Promise { resolver in
      let requestUrl = constantValueModel.apiDomain + "/config/basefromdb"
      AF // Alamofire
        .request(
          requestUrl,
          method: .get,
          headers: headers
        )
        .validate(statusCode: 200..<300)
        .responseData { response in
          switch response.result {
            case .success(let data):
              let decoder = JSONDecoder()
              guard let decodedResponse = try? decoder.decode(ConstantValuesModel.Result.self, from: data) else {
                print("Json decode エラー")
                return
              }
              self.userDefaultsModel.registerUserDefaults(
                key: UserDefaultsModel.defaultsKey.base.rawValue,
                value: String(decodedResponse.detail[0].value))
              // UserDefaultsへの登録確認
              print(self.userDefaultsModel.retrieveUserDefaults(key: UserDefaultsModel.defaultsKey.base.rawValue))
              resolver.fulfill(true)
            case .failure(let error):
              resolver.reject(error)
          }
        }
    }
  }
  
  // とりあえずテスト用
  func callSigninPost()  -> Promise<Bool> {
    return Promise { resolver in
      let requestUrl = constantValueModel.apiDomain + "/signin"
      AF // Alamofire
        .request(
          requestUrl,
          method: .post,
          headers: HTTPHeaders.default
        )
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData { response in
          switch response.result {
            case .success(let data):
              print(data)
              resolver.fulfill(true)
            case .failure(let error):
              print("error:\(error)")
              resolver.reject(error)
          }
        }
    }
  }
  
  // HTTPCookieStorageの内容を確認
  func printCookies() {
    // Cookieの取得方法
    if let cookies = HTTPCookieStorage.shared.cookies(for: URL(string: constantValueModel.apiDomain)!) {
      for cookie in cookies {
        print(cookie)
      }
    }
  }
}
