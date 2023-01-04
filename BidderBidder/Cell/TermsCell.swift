//
//  TermsCell.swift
//  BidderBidder
//
//  Created by 김성현 on 2022/11/18.
//

import UIKit
import RxSwift

class TermsCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var lblOption: UILabel!
    @IBOutlet weak var lblTitle: UILabel!

    var bag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()
        bag = DisposeBag()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func bind(_ data: Terms) {
        lblTitle.text = data.title.precomposedStringWithCanonicalMapping // NFD -> NFC

        switch data.type {
        case .main:
            let mandatoryName = data.isMandatory ? "(필수)" : "(선택)"
            lblOption.isHidden = false
            lblOption.text = mandatoryName
        case .sub:
            lblOption.isHidden = true
        }
        let checkImageName = data.isAccept ? "checkmark.circle.fill" : "checkmark.circle"
        btnCheck.setImage(UIImage(systemName: checkImageName), for: .normal)
    }
}
