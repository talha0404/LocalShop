//
//  HomeViewController.swift
//  LocalShop
//
//  Created by talha.sahin on 11.02.2024.
//

import UIKit

class HomeViewController: UIViewController {

    var vm: HomeViewModelProtocol?
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var searchBarView: SearchBar!
    var dataList: Product = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureCollectionView()
        // Register the custom cell XIB file
        setupUI()
        loadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Fetching data in viewWillAppear is suitable when you want to refresh the data every time the view appears or if the data can change while the user interacts with other parts of the app.
    }

    private func configureCollectionView() {
        productCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "productCell")
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.showsHorizontalScrollIndicator = false
    }

    private func setupUI() {
        navigationItem.title = "Home"
        configureSearchBar()
    }

    private func loadData() {
        vm?.loadProducts()
    }

    private func configureSearchBar() {
        searchBarView.layer.cornerRadius = 10
        searchBarView.layer.borderColor = UIColor(hex: "#d9d9d9")?.cgColor
        searchBarView.layer.borderWidth = 1
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ProductCollectionViewCell else { return ProductCollectionViewCell() }
         cell.configureData(data: dataList[indexPath.row])
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Adjust the width and height of the cell as needed
        let width = 150
        let height = 170

        return CGSize(width: width, height: height)
    }
}

extension HomeViewController: HomeViewModelDelegate { 
    func reloadData(product: Product) {
        dataList = product
        DispatchQueue.main.async {
            self.productCollectionView.reloadData()
        }
    }
}
