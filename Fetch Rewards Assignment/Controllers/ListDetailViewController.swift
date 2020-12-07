//
//  ListDetailViewController.swift
//  Fetch Rewards Assignment
//
//  Created by Latheeshwarraj Mohanraj on 10/28/20.
//  Copyright © 2020 Veg World. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {
    var listId:Int = 0
    var items:[Item] = []
    @IBOutlet weak var navigationTitle: UILabel!
    @IBOutlet weak var listDetailCollectionView: UICollectionView!
    @IBOutlet weak var goToTopButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCustomViews()
        setupCollectionView()
        hideNavigation()
        loadData()
    }
    
    func setCustomViews(){
        self.navigationTitle.text = "List \(listId)"
        goToTopButton.layer.cornerRadius = 24.0
    }
    
    func setupCollectionView(){
        listDetailCollectionView.register(UINib(nibName: "ListDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListDetailCollectionViewCell")
        listDetailCollectionView.delegate = self
        listDetailCollectionView.dataSource = self
    }
    
    func loadData(){
        items = items.sorted { (a, b) -> Bool in
            a.id < b.id
        }
        listDetailCollectionView.reloadData()
    }
    
    func hideNavigation(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goToTopButtonClicked(_ sender: Any) {
        self.listDetailCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0),
                                          at: .top,
                                    animated: true)
    }
}

extension ListDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListDetailCollectionViewCell", for: indexPath) as! ListDetailCollectionViewCell
        cell.setupView(items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.bounds.width, height: 50.0)
    }
}
