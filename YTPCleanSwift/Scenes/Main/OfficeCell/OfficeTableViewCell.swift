//
//  OfficeTableViewCell.swift
//  YTPCleanSwift
//
//  Created by Furkan MobBook on 11.03.2023.
//

import UIKit
import SDWebImage

class OfficeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var roomsLabel: UILabel!
    @IBOutlet weak var spaceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(viewModel: Office.Fetch.ViewModel.OfficeModel) {
        nameLabel.text = viewModel.name
        addressLabel.text = viewModel.address
        capacityLabel.text = "Capacity: \(viewModel.capacity ?? "Not Found")"
        roomsLabel.text = "Rooms: \(viewModel.rooms ?? "Not Found")"
        spaceLabel.text = "Space: \(viewModel.space ?? "Not Found")"
        cellImageView.sd_setImage(with: URL(string: viewModel.image ?? ""))
    }
    
}
