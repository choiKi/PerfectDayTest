//
//  AddViewController.swift
//  PerfectDay
//
//  Created by 최기훈 on 2022/05/14.
//

import UIKit
import CoreData

class AddViewController: UIViewController {

    
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var scheduleTextField: UITextField!
    
    let dateFormatter = DateFormatter()
    let timeStringFormatter = DateFormatter()
    
    let datePicker = UIDatePicker()
    
    let vc = ViewController()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
    }
    
    @IBAction func pressSaveBtn(_ sender: UIButton) {
        addSchedule()
        navigationController?.popViewController(animated: true)
    }
    
    
    func addSchedule() {
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "HHmm"
        let newSchedule = ScheduleByDate(context: self.context)
        let setTimeInt = dateFormatter.string(from: datePickerView.date)
        let setTimeString = timeStringFormatter.string(from: datePickerView.date)
        
        newSchedule.date = vc.todayLabel?.text
        newSchedule.title = scheduleTextField?.text
        newSchedule.time = Int32(setTimeInt)!
        newSchedule.success = false
        newSchedule.timeString = setTimeString
        
        do {
            try self.context.save()
        }
        catch {
            
        }
        vc.reloadTable()
        vc.tableView?.reloadData()
    }
     
    

}
