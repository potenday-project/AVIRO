//
//  RequestTableFieldModel.swift
//  AVIRO
//
//  Created by 전성훈 on 2023/06/20.
//

import Foundation

struct RequestTableFieldModel {
    var menu: String
    var price: String
    var howToRequest: String
    var isCheck: Bool
    
    var hasData: Bool {
        return !menu.isEmpty && !price.isEmpty
    }
}
