//
//  StepExt.swift
//  RxDust
//
//  Created by 임준화 on 2021/12/25.
//

import RxFlow

extension Step{
    var asTestStep: TestStep?{
        return self as? TestStep
    }
}
