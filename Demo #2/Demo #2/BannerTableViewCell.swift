//
//  BannerTableViewCell.swift
//  Demo #2
//
//  Created by Alexander Zimin on 17/05/2017.
//  Copyright © 2017 Alexander Zimin. All rights reserved.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

  @IBOutlet var bannerImageView: UIImageView! {
    didSet {
      bannerImageView.clipsToBounds = true
    }
  }

  @IBOutlet var bannerLabel: UILabel! {
    didSet {
      bannerLabel.numberOfLines = 0
      bannerLabel.textColor = UIColor.white
      bannerLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
  }

}
