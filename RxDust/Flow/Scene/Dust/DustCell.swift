//
//  DustCell.swift
//  RxDust
//
//  Created by 임준화 on 2021/12/26.
//

import UIKit
import SnapKit

final class DustCell: baseTableViewCell<AirQuality>{
    static let identifier = "Dust"
    
    private let stationNameLabel = UILabel()
    private let dataTimeLabel = UILabel()
    private let valueLabel = UILabel()
    private let sidoNameLabel = UILabel()
    
    override func configureCell() {
        super.configureCell()
        addView()
        setLayout()
    }
    private func addView(){
        [stationNameLabel, dataTimeLabel, valueLabel,sidoNameLabel].forEach{ addSubview($0) }
    }
    private func setLayout(){
        sidoNameLabel.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).offset(3)
            $0.centerY.equalToSuperview()
        }
        stationNameLabel.snp.makeConstraints {
            $0.trailing.equalTo(self.snp.trailing).inset(15)
            $0.centerY.equalToSuperview()
        }
        dataTimeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(sidoNameLabel.snp.trailing).offset(7)
            $0.trailing.equalTo(stationNameLabel.snp.leading).inset(7)
        }
        valueLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(sidoNameLabel.snp.trailing).offset(9)
            $0.trailing.equalTo(stationNameLabel.snp.leading).inset(9)
        }
    }
    override func bind(_ model: AirQuality) {
        sidoNameLabel.text = model.sidoName
        stationNameLabel.text = model.stationName
        dataTimeLabel.text = model.dataTime
        valueLabel.text = "\(model.pm10Value)"
    }
}
