//
//  MasterTableViewController.swift
//  LoadMore
//
//  Created by Trần Đức Anh on 10/5/18.
//  Copyright © 2018 Trần Đức Anh. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    var arrayNumbers = [Int](1...15)
    var pageIndex = 0 {
        didSet {
            if arrayNumbers.count <= 60 {
                for i in 1...10 {
                    arrayNumbers.append(pageIndex + i)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNumbers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      cell.textLabel?.text = String(arrayNumbers[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       let lastRow = arrayNumbers.count-1
        if lastRow == indexPath.row {
            loadMore()
            let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            spinner.startAnimating()
            spinner.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            tableView.tableFooterView = spinner
            tableView.tableFooterView?.isHidden = false
            if arrayNumbers.count >= 60 {
                spinner.stopAnimating()
            }
        }
    }
    
    private func loadMore() {
//        arrayNumbers.append(pageIndex)
        if arrayNumbers.count <= 60 {
            let last = arrayNumbers.last
            for i in 1...10 {
                arrayNumbers.append(last! + i)
            }
//            arrayNumbers += [Int](arrayNumbers.count..<(arrayNumbers.count + 10))
            tableView.reloadData()
        }
    }
}

