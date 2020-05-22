//
//  DataDisplayTableViewCell.swift
//  MyDestinations
//
//  Created by Ivan Barisic on 21/05/2020.
//  Copyright © 2020 Ivan Barisic. All rights reserved.
//

import UIKit
import SDWebImage

final class DataDisplayTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var destinationImageView: UIImageView!
    @IBOutlet weak var destinationTitleLabel: UILabel!
    @IBOutlet weak var destinationSubtitleLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        destinationTitleLabel.setAppearance(appearance: TitleLabelAppearnce())
        destinationSubtitleLabel.setAppearance(appearance: SubtitleLabelAppearnce())
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        destinationImageView?.sd_cancelCurrentImageLoad()
        destinationImageView?.image = nil
    }

    // MARK: - Public config
    func config(with destination: Destination) {
        destinationTitleLabel.text = destination.title
        destinationSubtitleLabel.text = destination.description
        if let image = destination.imageUrl {
            let url = URL(string: image)
            destinationImageView.sd_setImage(with: url, completed: nil)
        } else {
            destinationImageView.image = nil
        }
        
    }
}
