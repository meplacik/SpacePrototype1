//
//  CafeListViewController.swift
//  SpacePrototype1
//
//  Created by Ethan Furstoss on 4/15/19.
//  Copyright © 2019 Madeline Placik. All rights reserved.
//

import UIKit

class CafeListViewController: UIViewController {
    //MARK: Properties
    
    var allSpaces = [Cafe]()
    var spaces = [Cafe]()
    
    @IBOutlet weak var searchBar: UITextView!
    @IBOutlet weak var cafeTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the sample data.
        Data.initializeCountData()
        loadSampleSpaces()
        setUpTextView()
    }
    
    func setUpTextView(){
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        searchBar.layer.cornerRadius = 10
    }
    
    
    // MARK: - Table view data source
    
    
    

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
    
    private func loadSampleSpaces() {
        allSpaces = Data.loadSampleSpaces()
        spaces = Data.loadSampleSpaces()
    }
    
}


extension CafeListViewController: UITableViewDataSource, UITableViewDelegate, UITextViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SpaceTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SpaceTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SpaceTableViewCell.")
        }
        let space = spaces[indexPath.row]
        
        cell.nameLabel.text = space.name
        cell.photoImageView.image = space.photo
        cell.cafeDescription.text = space.description
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCafe = spaces[indexPath.row]
        if let cafeViewingVC = UIStoryboard(name: "CafeViewing", bundle: nil).instantiateInitialViewController() as? CafeViewingViewController{
            cafeViewingVC.cafe = selectedCafe
            self.navigationController?.present(cafeViewingVC, animated: true, completion: nil)
        }
    }
    
}
