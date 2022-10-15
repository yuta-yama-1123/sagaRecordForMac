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
  
  var series: [Series] = [
      Series("RS1"),
      Series("RS2"),
      Series("RS3"),
      Series("GB1"),
      Series("GB2"),
      Series("GB3"),
      Series("ES"),
      Series("US"),
      Series("SSG"),
      Series("RS"),
      Series("Other")
  ]
  
  var weapon: [Weapon] = [
      Weapon("Sword"),
      Weapon("GreatSword"),
      Weapon("Axe"),
      Weapon("Hummer"),
      Weapon("Gun"),
      Weapon("MartialArts"),
      Weapon("Rapier"),
      Weapon("Spear"),
      Weapon("Arrow"),
      Weapon("Wand")
  ]
  
  struct Result: Codable {
    var error: Bool
    var detail: [Base]
  }
  
  struct Base: Codable {
      var value: Int              // BASE値
      var update_at: String       // 最終更新日
  }
  
  // シリーズ管理
  struct Series: Identifiable {
    var id = UUID()
    var isChecked: Bool
    var name: String
      
    init(_ name: String) {
      self.isChecked = false
      self.name = name
    }
  }
  
  // 武器種管理
  struct Weapon: Identifiable {
    var id = UUID()
    var isChecked: Bool
    var name: String
      
    init(_ name: String) {
      self.isChecked = false
      self.name = name
    }
  }
}
