//
//  DetailsViewController.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 11.03.2023.
//

import UIKit
import SDWebImage

protocol DetailsDisplayLogic: AnyObject {
    func displayDetails(viewModel: Details.Fetch.ViewModel)
}

final class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var spaceLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var videoView: UIView!
    
    var interactor: DetailsBusinessLogic?
    var router: (DetailsRoutingLogic & DetailsDataPassing)?
    var viewModel: Details.Fetch.ViewModel?
    
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
        interactor?.fetchDetails()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = DetailsInteractor()
        let presenter = DetailsPresenter()
        let router = DetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension DetailsViewController {
    func setPage() {
        nameLabel.text = viewModel?.name
        addressLabel.text = viewModel?.address
        capacityLabel.text = viewModel?.capacity
        spaceLabel.text = viewModel?.space
        roomLabel.text = viewModel?.rooms
        imageView.sd_setImage(with: URL(string: viewModel?.image ?? ""))
    }
}

extension DetailsViewController: DetailsDisplayLogic {
    func displayDetails(viewModel: Details.Fetch.ViewModel) {
        self.viewModel = viewModel
        setPage()
    }
}
