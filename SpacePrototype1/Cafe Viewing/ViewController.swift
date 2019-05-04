//
//  ViewController.swift
//  SpacePrototype1
//
//  Created by Madeline Placik on 4/14/19.
//  Copyright © 2019 Madeline Placik. All rights reserved.
//

import UIKit

class CafeViewingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var cafe: Cafe!{
        didSet{
            setUpView()
        }
    }

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    
    @IBOutlet weak var pickerView1: UIPickerView!
    @IBOutlet weak var pickerView2: UIPickerView!
    @IBOutlet weak var pickerView3: UIPickerView!
    
    @IBOutlet weak var capacityLabel: UILabel!
    
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    let days = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    let hours = ["12:00","1:00","2:00","3:00","4:00","5:00","6:00","7:00","8:00","9:00","10:00","11:00"]
    let am_pm = ["AM","PM"]
    
    func setUpView(){
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == pickerView1){
            let titleRow = days[row].substring(3)
            return titleRow
        }
        else if (pickerView == pickerView2){
            let titleRow = hours[row]
            return titleRow
        }
        else if (pickerView == pickerView3){
            let titleRow = am_pm[row]
            return titleRow
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == pickerView1){
            return days.count
        }
        else if(pickerView == pickerView2){
            return hours.count
        }
        else if(pickerView == pickerView3){
            return am_pm.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == pickerView1){
            textField1.text = days[row]
        }
        else if(pickerView == pickerView2){
            textField2.text = hours[row]
        }
        else if(pickerView == pickerView3){
            textField3.text = am_pm[row]
        }
        setImages()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image1.layer.masksToBounds = true
        image2.layer.masksToBounds = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    let timeLapseImages:[Capacity] = [Capacity(rawImage: UIImage(named: "cafe-1.jpg")!, detectedImage: UIImage(named: "cafe1-results.jpg")!, capacity: 35, occupants: 30),
                                      Capacity(rawImage: UIImage(named: "cafe-2.jpg")!, detectedImage: UIImage(named: "cafe2-results.jpg")!, capacity: 35, occupants: 23),
                                      Capacity(rawImage: UIImage(named: "cafe-3.jpg")!, detectedImage: UIImage(named: "cafe3-results.jpg")!, capacity: 35, occupants: 26),
                                      Capacity(rawImage: UIImage(named: "cafe-4.jpg")!, detectedImage: UIImage(named: "cafe4-results.jpg")!, capacity: 35, occupants: 22),
                                      Capacity(rawImage: UIImage(named: "cafe-5.jpg")!, detectedImage: UIImage(named: "cafe5-results.jpg")!, capacity: 35, occupants: 26),
                                      Capacity(rawImage: UIImage(named: "cafe-6.jpg")!, detectedImage: UIImage(named: "cafe6-results.jpg")!, capacity: 35, occupants: 12),
                                      Capacity(rawImage: UIImage(named: "cafe-7.jpg")!, detectedImage: UIImage(named: "cafe7-results.jpg")!, capacity: 35, occupants: 8),
                                      Capacity(rawImage: UIImage(named: "cafe-8.jpg")!, detectedImage: UIImage(named: "cafe8-results.jpg")!, capacity: 35, occupants: 2)]
    
    let idealImage1 = [Capacity(rawImage: UIImage(named: "cafe-1-ideal.jpg")!, detectedImage: UIImage(named: "cafe-1-results-ideal.jpg")!, capacity: 30, occupants: 24)]
    let idealImage2 = [Capacity(rawImage: UIImage(named: "cafe-2-ideal.jpg")!, detectedImage: UIImage(named: "cafe-2-results-ideal.jpg")!, capacity: 12, occupants: 9)]
    var currentLapse = 0
    func setImages(){
        var pmOffset = 0
        if pickerView3.selectedRow(inComponent: 0) == 1{
            pmOffset += 1
        }
        
        let images = Data.getImage(for: cafe, weekDay: pickerView1.selectedRow(inComponent: 0), time: pickerView2.selectedRow(inComponent: 0) + pmOffset)
       
        let capaity = images[currentLapse]
        image1.image = capaity.rawImage
        image2.image = capaity.detectedImage
        
        capacityLabel.text = "\(names[ViewController.iteration % 2]) is \(capaity.capacityPercentage())% full. "
    }


}

