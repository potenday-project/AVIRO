//
//  VeganModel.swift
//  AVIRO
//
//  Created by 전성훈 on 2023/05/22.
//
//
import Foundation
enum MenuType: String {
    case vegan
    case needToRequset
    
    var value: String {
        switch self {
        case .vegan:
            return "vegan"
        case .needToRequset:
            return "need to request"
        }
    }
}

/// 사용자가 입력한 데이터
/// 옵셔널 데이터는 검색으로 입력, 좌표로 입력에 따라 값이 있고 없을 수 있기 때문
struct VeganModel: Codable {
    var placeId = UUID().uuidString
    var title: String
    var category: String
    var address: String
    var phone: String
    var url: String
    var x: Double
    var y: Double
    
    var allVegan: Bool
    var someMenuVegan: Bool
    var ifRequestVegan: Bool
    
    var menuArray: [MenuArray]?
}

struct MenuArray: Codable {
    var menuId = UUID().uuidString
    var menuType: String
    var menu: String
    var price: Int
    var howToRequest: String
    var isCheck: Bool
}
