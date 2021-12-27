//
//  DustCell.swift
//  RxDust
//
//  Created by 임준화 on 2021/12/26.
//

import UIKit
import SnapKit

final class DustCell: BaseTableViewCell<AirQualityItem>{
    static let identifier = "Dust"
    
    private lazy var stationNameLabel = UILabel()
    private lazy var dataTimeLabel = UILabel()
    private lazy var valueLabel = UILabel()
    private lazy var sidoNameLabel = UILabel()
    
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
            $0.left.equalTo(bounds.width*0.1)
            $0.centerY.equalToSuperview()
        }
        stationNameLabel.snp.makeConstraints {
            $0.left.equalTo(sidoNameLabel.snp.right).offset(bounds.width*0.09)
            $0.centerY.equalToSuperview()
        }
        dataTimeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(stationNameLabel.snp.right).offset(20)
        }
        valueLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.left.equalTo(bounds.width*1.07)
        }
    }
    override func bind(_ model: AirQualityItem) {
        sidoNameLabel.text = model.sidoName
        stationNameLabel.text = model.stationName
        dataTimeLabel.text = model.dataTime
        valueLabel.text = "\(model.pm10Value)㎍/㎥"
    }
}
