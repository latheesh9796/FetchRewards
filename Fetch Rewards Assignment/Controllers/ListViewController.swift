//
//  ListViewController.swift
//  Fetch Rewards Assignment
//
//  Created by Latheeshwarraj Mohanraj on 10/28/20.
//  Copyright © 2020 Veg World. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var listCollectionView: UICollectionView!
    var listViewModel: ListViewModel!
    var listMap: [Int:[Item]] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        listViewModel = ListViewModel();
        getListData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupCollectionView()
        hideNavigation()
    }
    
    func setupCollectionView(){
        listCollectionView.register(UINib(nibName: "ListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListCollectionViewCell")
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
    }
    
    func getListData(){
        listViewModel.getListData()
        listViewModel.getListDataCompletionHandler { (status, items) in
            if(status){
                for item in items {
                    if(item.name != "" && item.name != nil){
                        var listData = self.listMap[item.listID] ?? []
                        listData.append(item);
                        self.listMap[item.listID] = listData
                    }
                }
                self.listCollectionView.reloadData()
            }
        }
    }
    
    func hideNavigation(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listMap.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        let listId = indexPath.row + 1
        cell.setupView(listId, listMap[listId]?.count ?? 0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let listId = indexPath.row + 1
        let listDetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "ListDetailViewController") as! ListDetailViewController
        listDetailViewController.listId = listId
        listDetailViewController.items = listMap[listId] ?? []
        navigationController?.pushViewController(listDetailViewController, animated: true)
    }
    
}
