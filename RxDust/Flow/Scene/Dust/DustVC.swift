//
//  DustVC.swift
//  RxDust
//
//  Created by 임준화 on 2021/12/26.
//

import UIKit
import Then
import SnapKit
import RxRelay
import RxViewController

final class DustVC: baseVC<DustReactor>{
    
    private let tableView = UITableView().then {
        $0.register(DustCell.self, forCellReuseIdentifier: DustCell.identifier)
    }
    override func addView() {
        [tableView].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    override func configureVC() {
    }
    
    // MARK: - Reactor
    override func bindAction(reactor: DustReactor) {
        self.rx.viewWillAppear
            .map { _ in Reactor.Action.fetchAirQuality }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    override func bindState(reactor: DustReactor) {
        let shareState = reactor.state.share(replay: 1)
        
        shareState
            .compactMap { $0.airQuality }
            .bind(to: self.tableView.rx.items(cellIdentifier: DustCell.identifier, cellType: DustCell.self)) { index, element, cell in
                cell.model = element
            }
            .disposed(by: disposeBag)
        
    }
}
