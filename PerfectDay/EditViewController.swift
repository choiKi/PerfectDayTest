//
//  EditViewController.swift
//  PerfectDay
//
//  Created by 최기훈 on 2022/05/14.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var scheduleTextField: UITextField!
    
    let datePicker = UIDatePicker()
    
    var paramTitle : String?
    var paramTime : Int32?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scheduleTextField.text = paramTitle
    }
    
    @IBAction func pressEdit(_ sender: UIButton) {
        
        editList()
        navigationController?.popViewController(animated: true)
        
    }

    func editList() {
        
    }

}
