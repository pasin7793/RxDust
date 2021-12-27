//
//  AirQualityAPI.swift
//  RxDust
//
//  Created by 임준화 on 2021/12/25.
//

import Moya

enum AirQualityAPI{
    case fetchAirQuality
}

extension AirQualityAPI: TargetType{
    var baseURL: URL{
        return URL(string: "https://bigdata.gwangju.go.kr/gjAPI/getAtmosphere/getAtmospherelist.rd?apiSrvCd=0048&baseYmd=20210928&hour=05&numOfRow=20&pageNo=1")!
    }
    var path: String {
        switch self {
        case .fetchAirQuality:
            return "/"
        }
    }
    
    var method: Method {
        switch self {
        case .fetchAirQuality:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fetchAirQuality:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
