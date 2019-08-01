//
//  ViewController.swift
//  Reconsiderate
//
//  Created by Dev on 7/31/19.
//  Copyright © 2019 Wesaturate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tv.delegate = self
        tv.dataSource = self
        tv.frame = view.frame
        tv.rowHeight = view.frame.height
        view.addSubview(tv)
        view.backgroundColor = .lightGray
    }
    
    let tv: UITableView = {
        let tv = UITableView()
        tv.decelerationRate = UIScrollView.DecelerationRate.fast
        
        tv.isPagingEnabled = true
        return tv
    }()
    
    let ggenerator = UINotificationFeedbackGenerator()
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .white
        if indexPath.row == 1 {
            cell.backgroundColor = .lightGray
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("showing cell: \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        ggenerator.notificationOccurred(.warning)
        
    }
    
}

