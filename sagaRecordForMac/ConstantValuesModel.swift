//
//  ConstantValueModel.swift
//  sagaRecordForMac
//
//  Created by 山本祐太 on 2022/09/25.
//

import Foundation

class ConstantValuesModel {
  // もろもろ稼働確認用のAPIサーバドメイン
  let apiDomain: String = "https://nodejs-api-dev1123.herokuapp.com"
  
  struct Result: Codable {
    var error: Bool
    var detail: [Base]
  }
  
  struct Base: Codable {
      var value: Int              // BASE値
      var update_at: String       // 最終更新日
  }
}
