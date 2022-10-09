//
//  UserDefaultsModel.swift
//  sagaRecordForMac
//
//  Created by 山本祐太 on 2022/10/09.
//

import Foundation

class UserDefaultsModel {
  // 使用するUserDefaultsのキー情報
  enum defaultsKey: String {
    case base = "BASE" // ステータスのBASE値
  }
  
  func retrieveUserDefaults(key: String) -> String {
    guard let sampleUD = UserDefaults.standard.string(forKey: key) else { return "" }
    return sampleUD
  }
  
  func registerUserDefaults(key: String, value: String) {
    UserDefaults.standard.set(value, forKey: key)
  }
  
  func removeUserDefaults(key: String) {
    UserDefaults.standard.removeObject(forKey: key)
  }
}
