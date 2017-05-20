//
//  FirstViewController.swift
//  Demo #2
//
//  Created by Alexander Zimin on 17/05/2017.
//  Copyright © 2017 Alexander Zimin. All rights reserved.
//

import UIKit

extension FirstViewController {
  enum SectionType {
    case banner
    case user
  }
}

class FirstViewController: UIViewController {

  @IBOutlet var tableView: UITableView!
  var people = Person.testDataSet

  var sections: [SectionType] = [.user, .banner]

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = self
    tableView.estimatedRowHeight = 44.0
    tableView.rowHeight = UITableViewAutomaticDimension

    tableView.register(nibModels: [BannerTableViewCellModel.self, PersonTableViewCellModel.self])
  }

}

extension FirstViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let sectionType = sections[section]
    switch sectionType {
    case .banner:
      return 1
    case .user:
      return people.count
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let sectionType = sections[indexPath.section]
    let model: CellViewAnyModel
    switch sectionType {
    case .banner:
      model = BannerTableViewCellModel(bannerImage: #imageLiteral(resourceName: "img_banner_cocoa-heads"), title: "HI, Cocoa from model")
    case .user:
      let person = people[indexPath.row]
      model = PersonTableViewCellModel(person: person)
    }

    return tableView.dequeueReusableCell(withModel: model, for: indexPath)
  }

}
