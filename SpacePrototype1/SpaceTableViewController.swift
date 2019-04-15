//
//  SpaceTableViewController.swift
//  SpacePrototype1
//
//  Created by Madeline Placik on 4/14/19.
//  Copyright © 2019 Madeline Placik. All rights reserved.
//

import UIKit

class SpaceTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var spaces = [Space]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the sample data.
        loadSampleSpaces()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return spaces.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    //MARK: Private Methods
    
    private func loadSampleSpaces() {
        
        let photo1 = UIImage(named: "Uris_Cafe")
        let photo2 = UIImage(named: "Joes_Coffee")
        let photo3 = UIImage(named: "Carleton_Commons")
        
        guard let space1 = Space(name: "Uris Cafe", photo: photo1) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space2 = Space(name: "Joe Coffee", photo: photo2) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space3 = Space(name: "Carleton Commons", photo: photo3) else {
            fatalError("Unable to instantiate meal1")
        }
        
        spaces += [space1,space2,space3]
        
    }
}
