//
//  TodayViewController.swift
//  PerfectDay
//
//  Created by 최기훈 on 2022/05/13.
//

import UIKit

class TodayViewController: UIViewController {
    
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var tableView : UITableView!
    
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.dataSource = self
        
        dateFormatter.dateFormat = "YY년 M월 d일"
        var today = dateFormatter.string(from: Date())
        todayLabel.text = today
    }


}

extension TodayViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
}
