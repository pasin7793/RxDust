//
//  AirQuality.swift
//  RxDust
//
//  Created by 임준화 on 2021/12/24.
//

import Foundation

struct AirQualityResponse: Codable{
    let response: AirResponse
}
 
struct AirResponse: Codable{
    let body: AirBody
}

struct AirBody: Codable{
    let items: [AirQualityItem]?
}

struct AirQualityItem: Codable{
    let stationName: String //지역명
    let dataTime: String //측정 날짜
    let pm10Value: String //미세먼지 농도
    let sidoName: String //시도명 (광주)
}
