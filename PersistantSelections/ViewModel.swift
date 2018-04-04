//
//  ViewModelItem.swift
//  PersistantSelections
//
//  Created by Sukumar Anup Sukumaran on 16/11/17.
//  Copyright © 2017 Sukumar Anup Sukumaran. All rights reserved.
//

import Foundation
import UIKit


// note:- the ViewModelItem will own the model, and it will also hold the item title and the current selection state

// imagine this "dataArray" is called or parsed  from the  backend
let dataArray = [Model(title: "Swift"), Model(title: "Objective C"), Model(title: "Java"), Model(title: "Kotlin"), Model(title: "Java Script"), Model(title: "Python"), Model(title: "Ruby"), Model(title: "PHP"), Model(title: "Perl"), Model(title: "C#"), Model(title: "C++"), Model(title: "Pascal"), Model(title: "Visual Basic")]



//Class:1
class ViewModelItem {
    
    private var item: Model
    
    init(item: Model) {
        self.item = item
    }
    
    var isSelected = false
    
    var title: String {
        return item.title
    }
    
    
}

// Class:2

class ViewModel: NSObject {
    var items = [ViewModelItem]()
    
    var selectedItems: [ViewModelItem] {
        return items.filter{return $0.isSelected}
    }
    
    override init() {
        super.init()
        items = dataArray.map {ViewModelItem(item: $0)}
    }
    
}


extension ViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("called1")
        return items.count  // (1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         print("called2")
        if let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell {
            
             print("called3")
            cell.item = items[indexPath.row] // (2)
            
            cell.selectionStyle = .none
            
            // select/deselect the cell
            if items[indexPath.row].isSelected {
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none) // (3)
            
            } else {
                
                tableView.deselectRow(at: indexPath, animated: false) // (4)
            
            }
            return cell
       
        }
        return UITableViewCell()
    }
    
}



