//
//  baseTableViewCell.swift
//  RxDust
//
//  Created by 임준화 on 2021/12/26.
//

import UIKit
import SnapKit

class baseTableViewCell<T>: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        reuse()
    }
    func reuse(){
        
    }
    func configureCell() {
        selectionStyle = .none
        
    }
    var model: T? {
        didSet { if let model = model { bind(model) } }
    }
    func bind(_ model: T){}
}
