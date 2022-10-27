//
//  DetailsViewController.swift
//  NewsProject
//
//  Created by Rasit on 17.08.2022.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    var detailsModel : Article?
    
    var contentUser = ""
    var contentImage = ""
    
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var descriptionLabel: UILabel!
    @IBOutlet fileprivate weak var autherLabel: UILabel!
    @IBOutlet fileprivate weak var publishedAtLabel: UILabel!
    @IBOutlet fileprivate weak var urlImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = detailsModel?.title
        titleLabel.textColor = .red
        descriptionLabel.text = detailsModel?.articleDescription
        autherLabel.text = "Auther : \(detailsModel?.author ?? "")"
        publishedAtLabel.text = "Release date: \(DateFormatter.string(iso: detailsModel?.publishedAt ?? ""))"
        urlImage.kf.setImage(with: URL(string: detailsModel?.urlToImage ?? ""))
    }

    @IBAction func contentClicked(_ sender: Any) {
        let vc = ContentOfTheNewsViewController(nibName: "ContentOfTheNewsViewController", bundle: nil)
        vc.contentNews = detailsModel?.content ?? ""
        vc.contentNewsImage = detailsModel?.urlToImage ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
    }
}
