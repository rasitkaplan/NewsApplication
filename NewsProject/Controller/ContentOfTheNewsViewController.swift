//
//  ContentOfTheNewsViewController.swift
//  NewsProject
//
//  Created by Rasit on 17.08.2022.
//

import UIKit
import Kingfisher

class ContentOfTheNewsViewController: UIViewController {
    
    var contentNews = ""
    var contentNewsImage = ""
    
    @IBOutlet fileprivate weak var contentImage: UIImageView!
    @IBOutlet fileprivate weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextView.text = contentNews
        contentImage.kf.setImage(with: URL(string: contentNewsImage))
    }
}
