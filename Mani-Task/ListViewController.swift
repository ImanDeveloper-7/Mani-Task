//
//  ViewController.swift
//  Mani-Task
//
//  Created by Iman Zabihi on 22/12/2023.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tbl_myData: UITableView!
    @IBOutlet weak var lbl_title1: UILabel!
    @IBOutlet weak var lbl_description1: UILabel!
    @IBOutlet weak var lbl_title2: UILabel!
    @IBOutlet weak var lbl_description2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Fireworks"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailsViewController")
        self.present(vc, animated: true)
    }
}
