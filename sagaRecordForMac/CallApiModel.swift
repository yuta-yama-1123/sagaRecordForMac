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
  
  // とりあえずテスト用
  func callTouchPost()  -> Promise<Bool> {
    print()
    return Promise { resolver in
      let requestUrl = constantValueModel.apiDomain + "/touch"
      let param: Parameters = [
        "hoge": "fuga",
      ]
      let headers: HTTPHeaders = [
        "Content-Type":"application/x-www-form-urlencoded; charset=UTF-8"
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
}
