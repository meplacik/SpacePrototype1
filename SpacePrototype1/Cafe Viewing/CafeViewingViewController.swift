//
//  ViewController.swift
//  SpacePrototype1
//
//  Created by Madeline Placik on 4/14/19.
//  Copyright © 2019 Madeline Placik. All rights reserved.
//

import UIKit
import PieCharts

class CafeViewingViewController: UIViewController{
 
    
    var cafe: Cafe!{
        didSet{
        //    setUpView()
        }
    }
    
    
    @IBOutlet weak var cafeTitleLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    //Amenities
    @IBOutlet weak var wifiIconView: UIStackView!
    @IBOutlet weak var outletsIconView: UIStackView!
    @IBOutlet weak var ACIconView: UIStackView!
    @IBOutlet weak var bathroomsIconView: UIStackView!
    
    @IBOutlet weak var timePickerView: UIDatePicker!

    
    
    @IBOutlet weak var cafeImageView: UIImageView!
    
    @IBOutlet weak var capacityPieChart: PieChart!
    
    
    
    @IBOutlet weak var capacityLabel: UILabel!
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    /*
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
    */
    
    @IBAction func changedDate(_ sender: UIDatePicker) {
        updateCapacity()
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        //image1.layer.masksToBounds = true
       // image2.layer.masksToBounds = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setUpView(){
       wifiIconView.isHidden = !cafe.amenities.contains(.wifi)
       outletsIconView.isHidden = !cafe.amenities.contains(.outlets)
       ACIconView.isHidden = !cafe.amenities.contains(.airConditioning)
       bathroomsIconView.isHidden = !cafe.amenities.contains(.bathrooms)
       updateCapacity()
    }
/*
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
    */
    
    let occupiedColor = UIColor.red
    let openColor = UIColor.green
    func updateCapacity(){
        let capacity = cafe.getCapacity(at: timePickerView.date)
        let textLayerSettings = PiePlainTextLayerSettings()
        textLayerSettings.viewRadius = 55
        textLayerSettings.hideOnOverflow = true
        textLayerSettings.label.font = UIFont.systemFont(ofSize: 8)
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        textLayerSettings.label.textGenerator = {slice in
            if slice.data.model.color == self.openColor{
                return formatter.string(from: slice.data.model.value as NSNumber).map{"\($0) Open"} ?? ""
            }else{
                return formatter.string(from: slice.data.model.value as NSNumber).map{"\($0) Occupied"} ?? ""
            }
        }
    
        
        let textLayer = PiePlainTextLayer()
        textLayer.settings = textLayerSettings
        capacityPieChart.layers = [textLayer]
        capacityPieChart.models = [PieSliceModel(value: 10, color: occupiedColor), PieSliceModel(value: Double(capacity.capacity - capacity.occupants), color: openColor)]
        /*
        capacityPieChart.removeSlices()
        capacityPieChart.insertSlice(index: 0, model:  PieSliceModel(value: 10, color: UIColor.red))
        capacityPieChart.insertSlice(index: 1, model:  PieSliceModel(value: Double(capacity.capacity - capacity.occupants), color: UIColor.green))
 */
      //  print("TIME: \(hour) : \(minute)")
       // capacityLabel.text = "TIME: \(hour) : \(minute)"
        /*
        
        image1.image = capacity.rawImage
        image2.image = capacity.detectedImage
        
        capacityLabel.text = "\(cafe.name) is \(capacity.capacityPercentage())% full. "
 */
    }


}

