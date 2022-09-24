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
