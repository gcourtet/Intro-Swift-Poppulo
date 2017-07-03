//
//  ViewController.swift
//  cool
//
//  Created by Guillaume Courtet on 02/07/2017.
//  Copyright © 2017 Guillaume Courtet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let model = Model()
    
    @IBAction func deleteAction(_ sender: Any) {
        for i in self.model.getActions() {
            if self.model.isActionSelected(i) {
                self.model.deleteAction(i)
            }
        }
        self.TableView.reloadData()
    }
    @IBAction func add(_ sender: Any) {
        let alertController = UIAlertController(title: "Add action", message: "Enter an action name", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Add", style: .default, handler: {
            alert -> Void in
            
            let text = alertController.textFields![0] as UITextField
            var ok = false
            if let title = text.text {
                ok = self.model.add(title)
            }
            if !ok {
                let alertController = UIAlertController(title: "Error", message: "Action already exists", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: {
                    (action : UIAlertAction!) -> Void in
                    return
                })
                alertController.addAction(cancelAction)
                
                self.present(alertController, animated: true, completion: nil)
            } else {
                self.TableView.reloadData()
                return
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            return
        })
        
        alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.keyboardType = .default
            textField.placeholder = "Type name"
        })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.TableView.delegate = self
        self.TableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.model.changeState(self.model.getAction(indexPath.row))
        self.TableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.model.getAction(indexPath.row)
        if self.model.isActionSelected(self.model.getAction(indexPath.row)) {
            cell.imageView?.image = #imageLiteral(resourceName: "selected")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.getActions().count
    }
}

