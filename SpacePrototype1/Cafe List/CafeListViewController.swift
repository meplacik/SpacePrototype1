//
//  CafeListViewController.swift
//  SpacePrototype1
//
//  Created by Ethan Furstoss on 4/15/19.
//  Copyright © 2019 Madeline Placik. All rights reserved.
//

import UIKit

class CafeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {
    //MARK: Properties
    
    var allSpaces = [Space]()
    var spaces = [Space]()
    
    @IBOutlet weak var searchBar: UITextView!
    @IBOutlet weak var cafeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the sample data.
        loadSampleSpaces()
        setUpTextView()
    }
    
    func setUpTextView(){
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        searchBar.layer.cornerRadius = 10
    }
    
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return spaces.count
    }
    
    private func loadSampleSpaces() {
        
        let photo1 = UIImage(named: "Uris_Cafe")
        let photo2 = UIImage(named: "Joes_Coffee")
        let photo3 = UIImage(named: "Carleton_Commons")
        let photo4 = UIImage(named: "Hungarian_Pastry")
        let photo5 = UIImage(named: "Dr_Smood")
        let photo6 = UIImage(named: "Starbucks")
        
        guard let space1 = Space(name: "Uris Cafe", photo: photo1) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space2 = Space(name: "Joe Coffee", photo: photo2) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space3 = Space(name: "Carleton Commons", photo: photo3) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space4 = Space(name: "Hungarian_Pastry", photo: photo4) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space5 = Space(name: "Doctor Smood", photo: photo5) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space6 = Space(name: "Starbucks", photo: photo6) else {
            fatalError("Unable to instantiate meal1")
        }
        
        allSpaces = [space1,space2,space3,space4,space5,space6]
        spaces = [space1,space2,space3,space4,space5,space6]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SpaceTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SpaceTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SpaceTableViewCell.")
        }
        // Fetches the appropriate meal for the data source layout.
        let space = spaces[indexPath.row]
        
        cell.nameLabel.text = space.name
        cell.photoImageView.image = space.photo
        
        return cell
    }
    
    //: MARK - Search bar functionality.
    
    func textViewDidChange(_ textView: UITextView) {
        guard let searchString = textView.text else { return }
        if searchString.isEmpty{
            spaces = allSpaces
            cafeTableView.reloadData()
        }else{
            spaces = allSpaces.filter({$0.contains(searchString)})
            cafeTableView.reloadData()
        }
    }
}
