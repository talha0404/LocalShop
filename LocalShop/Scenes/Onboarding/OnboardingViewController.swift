//
//  OnboardingViewController.swift
//  LocalShop
//
//  Created by talha.sahin on 19.03.2024.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    var vm: OnboardingViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.addTarget(self, action: #selector(pageControlChangedValue), for: .valueChanged)
        vm = OnboardingViewModel()
        vm?.loadOnboardingData()
        configureUI()
    }

    deinit {
         // Perform cleanup tasks here, such as removing observers or releasing resources
         pageControl.removeTarget(self, action: #selector(pageControlChangedValue), for: .valueChanged)
     }

    /// Private functions
    private func configureOnboardingCollectionView() {
        onboardingCollectionView.dataSource = self
        onboardingCollectionView.delegate = self
        onboardingCollectionView.isPagingEnabled = true
        onboardingCollectionView.isScrollEnabled = true
        onboardingCollectionView.showsHorizontalScrollIndicator = false
    }

    private func configureUI() {
        configureOnboardingCollectionView()
    }

    private func setNextBtnTitle() {
        let title = vm.buttonTitle()
        nextBtn.setTitle(title, for: .normal)
    }

    // Method to scroll to a specific page
    private func scrollToPage(_ page: Int) {
        let indexPath = IndexPath(item: page, section: 0)
        onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    ///Outlet functions
    @IBAction func nextBtnTapped(_ sender: Any) {
        guard !vm.isLastPage else {
            let controller = LoginViewController()
            navigationController?.pushViewController(controller, animated: true)
            return
        }

        vm.nextPage()
        pageControl.currentPage = vm.currentPage
        setNextBtnTitle()
        scrollToPage(vm.currentPage)
    }

    /// Obj functions
    @objc private func pageControlChangedValue() {
        vm.currentPage = pageControl.currentPage
        scrollToPage(vm.currentPage)
        setNextBtnTitle()
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.onboardingData.count
    }
}

extension OnboardingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = onboardingCollectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else { return OnboardingCollectionViewCell() }
        cell.configureUICell(data: vm.onboardingData[indexPath.row])
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height

        return CGSize(width: width, height: height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        vm.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = vm.currentPage
        setNextBtnTitle()        
    }
}
