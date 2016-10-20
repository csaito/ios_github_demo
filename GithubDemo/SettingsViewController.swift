//
//  SettingsViewController.swift
//  GithubDemo
//
//  Created by Chihiro Saito on 10/20/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {



    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var settingsTableView: UITableView!
    
    var minimumStars = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func starSliderValueChanged(_ sender: AnyObject) {
        let cell = settingsTableView.cellForRow(at: IndexPath(row:0, section:0)) as! SettingsStarTableViewCell
        self.minimumStars = Int((sender as! UISlider).value)
        cell.starCountLabel.text = "\(minimumStars)"

    }
  
}

// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsStarTableViewCell", for: indexPath) as! SettingsStarTableViewCell
        
        return cell
    }

    
}

