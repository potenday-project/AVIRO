//
//  KakaoMapRequestAPI.swift
//  AVIRO
//
//  Created by 전성훈 on 2023/05/21.
//

import Foundation

struct KakaoMapRequestAPI {
    // MARK: 주소
    static let scheme = "https"
    static let host = "dapi.kakao.com"
    static let keywordPath = "/v2/local/search/keyword"
    static let coordinatePath = "/v2/local/geo/coord2address"
    
    // MARK: key
    static let query = "query"
    static let category = "category_group_code"
    static let longitude = "x"
    static let latitude = "y"
    static let sort = "sort"
    static let page = "page"
    
    // MARK: static query
    // 사용자 기준 거리순 정렬
    static let sortValue = "accuracy"
    // CE7: 카페, FD6: 음식점
    static let categoryValue = "CE7, FD6"
    
    // MARK: Keyword Search Components 만들기 함수
    func searchInfo(query: String,
                    longitude: String,
                    latitude: String,
                    page: String
    ) -> URLComponents {
        var components = URLComponents()
        components.scheme = KakaoMapRequestAPI.scheme
        components.host = KakaoMapRequestAPI.host
        components.path = KakaoMapRequestAPI.keywordPath

        components.queryItems = [
            URLQueryItem(name: KakaoMapRequestAPI.query, value: query),
            URLQueryItem(name: KakaoMapRequestAPI.category, value: KakaoMapRequestAPI.categoryValue),
            URLQueryItem(name: KakaoMapRequestAPI.longitude, value: longitude),
            URLQueryItem(name: KakaoMapRequestAPI.latitude, value: latitude),
            URLQueryItem(name: KakaoMapRequestAPI.sort, value: KakaoMapRequestAPI.sortValue),
            URLQueryItem(name: KakaoMapRequestAPI.page, value: page)
        ]
        
        return components
    }
    
    // MARK: Coordinate Search Components 만들기 함수
    func searchCoodinate(longitude: String,
                         latitude: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = KakaoMapRequestAPI.scheme
        components.host = KakaoMapRequestAPI.host
        components.path = KakaoMapRequestAPI.coordinatePath
        
        components.queryItems = [
            URLQueryItem(name: "x", value: longitude),
            URLQueryItem(name: "y", value: latitude)
        ]
        
        return components
    }
}
