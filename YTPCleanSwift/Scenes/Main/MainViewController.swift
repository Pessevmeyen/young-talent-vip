//
//  MainViewController.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 11.03.2023.
//

import UIKit

protocol MainDisplayLogic: AnyObject {
    func displayOffices(viewModel: Office.Fetch.ViewModel)
}

final class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var officesLabel: UILabel!
    
    var interactor: MainBusinessLogic?
    var router: (MainRoutingLogic & MainDataPassing)?
    let refreshControl = UIRefreshControl()
    var viewModel: Office.Fetch.ViewModel?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        refreshTableView()
        // 1
        interactor?.fetchData(request: .init(result: "10"))
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "OfficeTableViewCell", bundle: .main), forCellReuseIdentifier: "OfficeTableViewCell")
    }
    
    private func refreshTableView() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull Down to Refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc private func refresh() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
        Loader.shared.animationView.stopAnimating()
    }
}

extension MainViewController: MainDisplayLogic {
    // 6
    func displayOffices(viewModel: Office.Fetch.ViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.officesListViewModel.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OfficeTableViewCell", for: indexPath) as? OfficeTableViewCell,
              let model = viewModel?.officesListViewModel[indexPath.row] else { return UITableViewCell()}
        cell.setCell(viewModel: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToDetail(index: indexPath.row)
    }
}
