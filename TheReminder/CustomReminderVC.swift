//
//  CustomReminderVC.swift
//  TheReminder
//
//  Created by Chinky Mutreja on 20/5/18.
//  Copyright © 2018 Chinky Mutreja. All rights reserved.
//

import UIKit

class CustomReminderVC: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    // vars and constants
    let frequency = ["Just Once","Daily","Weekly","Monthly"]
    var current = Date()
    
    // Outlets
    
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var editdate: UIButton!
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var datepick: UIDatePicker!
    @IBOutlet weak var descText: UITextField!
    
    @IBOutlet weak var editFrq: UIButton!
    @IBOutlet weak var freqText: UILabel!
    
    @IBOutlet weak var freqPick: UIPickerView!
    
    
    
    @IBAction func datePicked(_ sender: UIDatePicker) {
        current = datepick.date
        updateDateLabel()
        
        editdate.isHidden = false
        currentDate.isHidden = false
        datepick.isHidden = true
    }
    
    
    
    @IBAction func editDate(_ sender: UIButton) {
        editdate.isHidden = true
        currentDate.isHidden = true
        datepick.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        freqPick.isHidden = true
        freqPick.delegate = self
       freqPick.dataSource = self
        updateDateLabel()
        datepick.isHidden = true
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func editFrequency(_ sender: UIButton) {
        freqText.isHidden = true
        editFrq.isHidden = true
        freqPick.isHidden = false
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        print("nums")
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("abc")
        return frequency.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(frequency)
        return frequency[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        freqText.text = frequency[row]
        freqText.isHidden = false
        freqPick.isHidden = true
        editFrq.isHidden = false
        
    }
    
    func updateDateLabel(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        currentDate.text = formatter.string(from: current)
    }
    
}
