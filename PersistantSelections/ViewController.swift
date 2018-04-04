//
//  ViewController.swift
//  PersistantSelections
//
//  Created by Sukumar Anup Sukumaran on 16/11/17.
//  Copyright © 2017 Sukumar Anup Sukumaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var viewModel = ViewModel()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.register(CustomCell.nib, forCellReuseIdentifier: CustomCell.identifier)
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.allowsMultipleSelection = true
        tableView?.dataSource = viewModel
        tableView?.delegate = self
        tableView?.separatorStyle = .none
        
        nextButton?.isEnabled = !viewModel.selectedItems.isEmpty
    }
    
    
    @IBAction func next(_ sender: Any) {
        
        tableView.reloadData()
        print("selectesd = \(viewModel.selectedItems.map{$0.title})")
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.items[indexPath.row].isSelected = true
        
        nextButton?.isEnabled = !viewModel.selectedItems.isEmpty
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        viewModel.items[indexPath.row].isSelected = false
        nextButton?.isEnabled = !viewModel.selectedItems.isEmpty
    }
    
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if viewModel.selectedItems.count > 2 {
            return nil
        }
        return indexPath
    }
}

