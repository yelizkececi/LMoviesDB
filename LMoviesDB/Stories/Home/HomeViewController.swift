//
//  HomeViewController.swift
//  LMoviesDB
//
//  Created by Yeliz Keçeci on 24.06.2022.
//

import UIKit
import ImageSlideshow

class HomeViewController: UIViewController {

    private var homeViewModel = HomeViewModel()
    let cellReuseIdentifier = "MovieTableViewCell"
    let headerCellReuseIdentifier = "MovieHeaderTableViewCell"

    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: headerCellReuseIdentifier, bundle: nil), forCellReuseIdentifier: headerCellReuseIdentifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! MovieTableViewCell
        let movieViewModel = MoviesViewModel(self.homeViewModel.movieAtIndex(indexPath.row))
         cell.configure(for: movieViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: headerCellReuseIdentifier) as! MovieHeaderTableViewCell
        cell.configure()
        return cell
    }
    
}

