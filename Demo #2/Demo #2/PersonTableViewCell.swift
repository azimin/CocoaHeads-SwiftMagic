//
//  PersonTableViewCell.swift
//  Demo #2
//
//  Created by Alexander Zimin on 17/05/2017.
//  Copyright © 2017 Alexander Zimin. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

  @IBOutlet var nameLabel: UILabel! {
    didSet {
      nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
      nameLabel.numberOfLines = 0
    }
  }

  @IBOutlet var ageLabel: UILabel! {
    didSet {
      ageLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
      ageLabel.numberOfLines = 0
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .none
  }
}
