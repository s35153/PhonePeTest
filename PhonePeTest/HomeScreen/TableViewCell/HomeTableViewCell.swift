//
//  HomeTableViewCell.swift
//  PhonePeTest
//
//  Created by Sheetal Jha on 16/03/24.
//

import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell {

    static let reuseIdentifier = "cell"

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        return label
    }()

    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(titleLabel)
        addSubview(detailLabel)

        titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(16)
        }

        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.right.bottom.equalToSuperview().inset(16)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
