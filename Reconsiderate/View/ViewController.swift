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
        tv.allowsSelection = false
        tv.showsVerticalScrollIndicator = false
        
        tv.register(cellWithClass: HomeContainerCell.self)
        tv.register(cellWithClass: RecentCell.self)
        
        view.addSubview(tv)
        view.backgroundColor = .white
    }
    
    let tv: UITableView = {
        let tv = UITableView()
        tv.decelerationRate = UIScrollView.DecelerationRate.fast
        
        tv.isPagingEnabled = true
        return tv
    }()
    
    let generator = UINotificationFeedbackGenerator()
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withClass: HomeContainerCell.self, for: indexPath)
            cell.cv.delegate = self
            cell.router = self
            return cell
        }
        let cell = tableView.dequeueReusableCell(withClass: RecentCell.self, for: indexPath)
        cell.toHome.addTapGestureRecognizer(action: scrollToHome)
        cell.viewModel = RecentCellViewModel()
        cell.cvDatasource = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        generator.notificationOccurred(.success)
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    // table view should only scroll on home view
    // thought view has nothing below it... yet
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            tv.isScrollEnabled = false
        } else {
            tv.isScrollEnabled = true
        }
    }
}

extension ViewController: HomeControllerDelegate {
    func moveScrollView(to view: HomeCells) {
        if view == .recent {
            tv.scrollToRow(at: IndexPath(item: 1, section: 0), at: .middle, animated: true)
        }
    }
    
    func scrollToHome() {
        tv.scrollToRow(at: IndexPath(item: 0, section: 0), at: .middle, animated: true)
    }
}


protocol HomeControllerDelegate {
    func moveScrollView(to view: HomeCells)
    
}

enum HomeCells {
    case newThought, home, recent
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: NotePreviewCell.self, for: indexPath)
        
        return cell
    }
}
