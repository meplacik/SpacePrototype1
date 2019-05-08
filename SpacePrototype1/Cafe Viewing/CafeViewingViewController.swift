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
 
    
    var cafe: Cafe!
    
    var capacity: Capacity?
    
    
    @IBOutlet weak var cafeTitleLabel: UILabel!
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //Amenities
    @IBOutlet weak var wifiIconView: UIStackView!
    @IBOutlet weak var outletsIconView: UIStackView!
    @IBOutlet weak var ACIconView: UIStackView!
    @IBOutlet weak var bathroomsIconView: UIStackView!
    
    @IBOutlet weak var priceIconView: UIImageView!
    
    @IBOutlet weak var timePickerView: UIDatePicker!

    @IBOutlet weak var cafeImageView: UIImageView!
    
    @IBOutlet weak var capacityPieChart: PieChart!
    
    @IBOutlet weak var capacityLabel: UILabel!

    @IBOutlet weak var disabledUp: UIButton!
    @IBOutlet weak var disabledDown: UIButton!
    
    @IBAction func thumbsUp(_ sender: UIButton) {
        sender.isSelected = true
        disabledDown.isEnabled = false
    }
    @IBAction func thumbsDown(_ sender: UIButton) {
        sender.isSelected = true
        disabledUp.isEnabled = false
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBAction func changedDate(_ sender: UIDatePicker) {
        updateCapacity()
    }
    
    @IBOutlet weak var detectionSwitch: UISwitch!
    
    @IBAction func switchedRevealDetection(_ sender: UISwitch) {
        if detectionSwitch.isOn{
            cafeImageView.image = capacity?.detectedImage
        }else{
            cafeImageView.image = capacity?.rawImage
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cafeImageView.layer.masksToBounds = true
        cafeImageView.layer.cornerRadius = 10
        setUpView()
        //image1.layer.masksToBounds = true
       // image2.layer.masksToBounds = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setUpView(){
       timePickerView.setDate(Date(timeIntervalSince1970: 39600), animated: false)
       wifiIconView.isHidden = !cafe.amenities.contains(.wifi)
       outletsIconView.isHidden = !cafe.amenities.contains(.outlets)
       ACIconView.isHidden = !cafe.amenities.contains(.airConditioning)
       bathroomsIconView.isHidden = !cafe.amenities.contains(.bathrooms)
       cafeTitleLabel.text = cafe.name
       switch cafe.price{
       case .low:
            priceIconView.image = #imageLiteral(resourceName: "low_price")
       case .average:
            priceIconView.image = #imageLiteral(resourceName: "avg_price")
       case .high:
            priceIconView.image = #imageLiteral(resourceName: "high_price")
       }
       updateCapacity()
    }
    
    let occupiedColor = UIColor(red: 1, green: 100/255, blue: 0, alpha: 1)
    let openColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
    func updateCapacity(){
        let capacity = cafe.getCapacity(at: timePickerView.date)
        self.capacity = capacity
        if detectionSwitch.isOn{
             cafeImageView.image = capacity.detectedImage
        }else{
             cafeImageView.image = capacity.rawImage
        }
        
        let textLayerSettings = PiePlainTextLayerSettings()
        textLayerSettings.viewRadius = 55
        textLayerSettings.hideOnOverflow = true
        //textLayerSettings.label.font = UIFont.systemFont(ofSize: 8)
        
        guard let customFont = UIFont(name: "Roboto-Regular", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font.
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
            )
        }
        textLayerSettings.label.font = UIFontMetrics.default.scaledFont(for: customFont)
        textLayerSettings.label.font = UIFontMetrics.default.scaledFont(for: customFont)
       // textLayerSettings.label.adjustsFontForContentSizeCategory = true
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        textLayerSettings.label.textGenerator = {slice in
            if slice.data.model.color == self.openColor{
                return formatter.string(from: slice.data.model.value as NSNumber).map{"\($0) Open"} ?? ""
            }else{
                return formatter.string(from: slice.data.model.value as NSNumber).map{"\($0) Occupied"} ?? ""
            }
        }
    
       capacityPieChart.clear()
        let textLayer = PiePlainTextLayer()
        textLayer.settings = textLayerSettings
        capacityPieChart.layers = [textLayer]
        print(capacity.occupants)
        capacityPieChart.models = [PieSliceModel(value: Double(capacity.occupants), color: occupiedColor), PieSliceModel(value: Double(capacity.capacity - capacity.occupants), color: openColor)]
        
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

