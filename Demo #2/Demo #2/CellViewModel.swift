//
//  CellViewModel.swift
//  Demo #2
//
//  Created by Alexander Zimin on 17/05/2017.
//  Copyright © 2017 Alexander Zimin. All rights reserved.
//

import UIKit

protocol CellViewAnyModel {
  static var cellAnyType: UIView.Type { get }
  func setupAny(cell: UIView)
}

protocol CellViewModel: CellViewAnyModel {
  associatedtype CellType: UIView
  func setup(cell: CellType)
}

extension CellViewModel {
  static var cellAnyType: UIView.Type {
    return CellType.self
  }

  func setupAny(cell: UIView) {
    if let cell = cell as? CellType {
      setup(cell: cell)
    } else {
      assertionFailure("Wrong usage")
    }
  }
}

struct BannerTableViewCellModel {
  let bannerImage: UIImage
  let title: String
}

extension UITableView {
  func dequeueReusableCell(withModel model: CellViewAnyModel, for indexPath: IndexPath) -> UITableViewCell {
    let indetifier = String(describing: type(of: model).cellAnyType)
    let cell = self.dequeueReusableCell(withIdentifier: indetifier, for: indexPath)

    model.setupAny(cell: cell)
    return cell
  }

  func register(nibModels: [CellViewAnyModel.Type]) {
    for model in nibModels {
      let identifier = String(describing: model.cellAnyType)
      let nib = UINib(nibName: identifier, bundle: nil)
      self.register(nib, forCellReuseIdentifier: identifier)
    }
  }

}

extension BannerTableViewCellModel: CellViewModel {
  func setup(cell: BannerTableViewCell) {
    cell.bannerLabel.text = title
    cell.bannerImageView.image = bannerImage
  }
}

struct PersonTableViewCellModel {
  let person: Person

  var fullName: String {
    return person.name + " " + person.surname
  }
}

extension PersonTableViewCellModel: CellViewModel {
  func setup(cell: PersonTableViewCell) {
    cell.nameLabel.text = fullName
    cell.ageLabel.text = "\(person.age)"
  }
}

