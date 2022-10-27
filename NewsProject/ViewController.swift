//
//  ViewController.swift
//  NewsProject
//
//  Created by Rasit on 17.08.2022.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variables
    var newspaper : NewsModel?
    var viewModel = NewsViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getNews()
        viewModel.delegate = self
        registerTableView()
    }
    
    // MARK: Register TableView
    func registerTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }
}

//MARK: TableView Protocols

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newspaper?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.nameLabel.text = newspaper?.articles?[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        vc.detailsModel = self.newspaper?.articles?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: ViewModel Protocols
extension ViewController: PassToData {
       func passToData(news: NewsModel?) {
           self.newspaper = news
           tableView.reloadData()
       }
}
