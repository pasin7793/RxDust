//
//  NetworkManager.swift
//  RxDust
//
//  Created by 임준화 on 2021/12/26.
//

import RxSwift
import Moya

protocol NetworkManagerType: class{
    func fetchAirQuality() -> Single<Response>
}

final class NetworkManager: NetworkManagerType{
    static let shared = NetworkManager()
    
    private let provider = MoyaProvider<AirQualityAPI>()
    func fetchAirQuality() -> Single<Response> {
        return provider.rx.request(.fetchAirQuality, callbackQueue: .global())
    }
}
