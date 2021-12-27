//
//  DustReactor.swift
//  RxDust
//
//  Created by 임준화 on 2021/12/26.
//

import ReactorKit
import RxSwift
import RxFlow
import RxRelay

final class DustReactor: Reactor,Stepper{
    
    private let disposeBag: DisposeBag = .init()
    var steps: PublishRelay<Step> = .init()
    
    enum Action{
        case fetchAirQuality
    }
    enum Mutation{
        case setAirQuality(_ airQuality: [AirQualityItem])
    }
    struct State{
        var airQuality: [AirQualityItem]?
    }
    var initialState: State = State()
}

extension DustReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .fetchAirQuality:
            return fetchAirQuality()
        default:
            return .empty()
        }
    }
}
extension DustReactor{
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setAirQuality(AirQuality):
            newState.airQuality = AirQuality
        }
        return newState
    }
}
private extension DustReactor{
    func fetchAirQuality() -> Observable<Mutation>{
        return NetworkManager.shared.fetchAirQuality()
            .filterSuccessfulStatusCodes()
            .map(AirQualityResponse.self)
            .map{ $0.response.body.items ?? [] }
            .catch { [weak self] err in
                print(err.localizedDescription)
                self?.steps.accept(TestStep.alert(title: "DustInGwangju", message: "몰?루"))
                return .never()
            }
            .asObservable()
            .map {Mutation.setAirQuality($0)}
    }
}
