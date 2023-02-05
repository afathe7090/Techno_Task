//
//  MoviesVIewController.swift
//  Techno_Task
//
//  Created by Ahmed Fathy on 05/02/2023.
//

import UIKit
import Combine

class MoviesVIewController: UIViewController {

    // MARK: - Outlet
    
    @IBOutlet weak var btnYear: UIButton!
    @IBOutlet weak var btnRate: UIButton!
    @IBOutlet weak var moviesTableView: UITableView!

    // MARK: - Proberties
    private let viewModel: MoviesViewModelProtocol
    private var adapter: MoviesDatasources?
    private var anyCancellable = Set<AnyCancellable>()
    // MARK: - Init
    init(viewModel: MoviesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "MoviesVIewController", bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError() }

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerMoviesCell()
        viewModel.viewDidLoad()
        configureMoviesTableViewDataSources()
    }
    // MARK: - Functions
    fileprivate func registerMoviesCell() {
        moviesTableView.register(UINib(nibName: "MoviesCell", bundle: nil), forCellReuseIdentifier: "MoviesCell")
    }
    fileprivate func configureMoviesTableViewDataSources() {
        viewModel.output.$itemViewModel
            .compactMap({$0})
            .receive(on: DispatchQueue.main)
            .sink {[weak self]  viewModel in
                self?.confgureDataSources(itemViewModel: viewModel!)
            }.store(in: &anyCancellable)
    }
    fileprivate func confgureDataSources(itemViewModel: MoviesDatasourcesViewModel) {
        adapter = MoviesDatasources(viewModel: itemViewModel)
        moviesTableView.dataSource = adapter
        moviesTableView.delegate = adapter
        moviesTableView.reloadData()
    }
    // MARK: -  Tap Actions
    @IBAction
    func didTabYears(_ sender: UIButton){
        viewModel.loadMovies(sortedBy: .year)
        sender.tintColor = .blue
        btnRate.tintColor = .black
    }
    @IBAction
    func didTabRated(_ sender: UIButton){
        viewModel.loadMovies(sortedBy: .rate)
        sender.tintColor = .blue
        btnYear.tintColor = .black
    }
}
