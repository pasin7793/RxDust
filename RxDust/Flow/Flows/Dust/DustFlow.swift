//
//  DustFlow.swift
//  RxDust
//
//  Created by 임준화 on 2021/12/26.
//

import RxFlow
import RxRelay

struct DustStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return TestStep.dustIsRequired
    }
}

final class DustFlow: Flow{
    var root: Presentable{
        return self.rootVC
    }
    let stepper: DustStepper
    private let rootVC = UINavigationController()
    init(
        with stepper: DustStepper
    ){
        self.stepper = stepper
    }
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asTestStep else { return .none}
        switch step {
        case .dustIsRequired:
            return coordinateToDust()
        default:
            return .none
        }
    }
}

private extension DustFlow{
    func coordinateToDust() -> FlowContributors{
        let reactor = DustReactor()
        let vc = DustVC(reactor: reactor)
        self.rootVC.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
}
