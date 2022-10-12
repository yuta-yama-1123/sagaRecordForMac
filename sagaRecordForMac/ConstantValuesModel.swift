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
  
  /// 個々の書籍情報の型
  struct Result: Codable {
      var base: Base              // 書籍データのID
  }
  
  /// 個々の書籍情報の型
  struct Base: Codable {
      var value: Int              // BASE値
      var update_at: String       // 最終更新日
  }
}
