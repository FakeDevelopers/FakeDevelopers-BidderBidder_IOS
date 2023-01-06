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
    @IBOutlet weak var CheckButton: UIButton!
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
            let mandatoryName = data.isMandatory ? "\(Constant.requiredKR)" : "\(Constant.choiceKR)"
            lblOption.isHidden = false
            lblOption.text = mandatoryName
        case .sub:
            lblOption.isHidden = true
        }
        let checkImageName = data.isAccept ? "\(Constant.checkmarkCircleFill)" : "\(Constant.checkmarkCircle)"
        CheckButton.setImage(UIImage(systemName: checkImageName), for: .normal)
    }
}
