//
//  SecondViewController.swift
//  Demo #2
//
//  Created by Alexander Zimin on 17/05/2017.
//  Copyright © 2017 Alexander Zimin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  @IBOutlet var tableView: UITableView!
  var people = Person.testDataSet + Person.testDataSet

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = self
    tableView.estimatedRowHeight = 44.0
    tableView.rowHeight = UITableViewAutomaticDimension

    tableView.register(nibModels: [PersonTableViewCellModel.self])
  }

}

extension SecondViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let model = PersonTableViewCellModel(person: people[indexPath.row])
    return tableView.dequeueReusableCell(withModel: model, for: indexPath)
  }
}
