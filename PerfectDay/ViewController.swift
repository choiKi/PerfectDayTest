//
//  ViewController.swift
//  PerfectDay
//
//  Created by comsoft on 2022/05/02.
//

import UIKit
import FSCalendar
import CoreData

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    // MARK:- OUtlet
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Property
    let dateFormatter = DateFormatter()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    var scList : [ScheduleByDate]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calendar.delegate = self
        calendar.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        
        
        calendarSetting()
        daySetting()
        
        reloadTable()

    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
        
    @IBAction func addBtnPress(_ sender: UIButton) {
        let addVC = UIStoryboard(name: "AddView", bundle: nil).instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        
        navigationController?.pushViewController(addVC, animated: true)
    }
    
    func reloadTable() {
        do {
            self.scList =  try! context.fetch(ScheduleByDate.fetchRequest())
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
            
        } catch {
            
        }
        
    }
 
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.scList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scListCell", for: indexPath) as! ScheduleTableViewCell
        
        
        let sc = self.scList?[indexPath.row]
        
        cell.title.text = sc?.title
        cell.time?.text = sc?.timeString
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            let scheduleToRemove = self.scList![indexPath.row]
            
            self.context.delete(scheduleToRemove)
            
            do {
                try self.context.save()
            }
            catch {
                
            }
            self.reloadTable()
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sc = self.scList?[indexPath.row]
        
        let editVC = UIStoryboard(name: "EditView", bundle: nil).instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        
        editVC.paramTitle = scList?[indexPath.row].title
        editVC.paramTime = scList?[indexPath.row].time
        
        self.navigationController?.pushViewController(editVC, animated: true)
    }
    
    
}

extension ViewController {
    
    func calendarSetting() {
        // 선택된 날짜 색
        calendar.appearance.selectionColor = UIColor(red: 38/255, green: 153/255, blue: 251/255, alpha: 1)
        // 오늘 날짜 색
        calendar.appearance.todayColor = UIColor(red: 188/255, green: 224/255, blue: 253/255, alpha: 1)
        // 달력 스크롤 수직
        calendar.scrollDirection = .vertical
        calendar.appearance.titleWeekendColor = .red
        calendar.appearance.headerDateFormat = "YYYY년  M월"
        
        
    }
    
    func daySetting() {
        dateFormatter.dateFormat = "YY년 M월 d일"
        var today = dateFormatter.string(from: Date())
        todayLabel.text = today
        
    }
    
    public func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "YY년 M월 d일"
         todayLabel.text = dateFormatter.string(from: date)
     }

}

