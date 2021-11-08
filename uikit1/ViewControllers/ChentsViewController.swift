//
//  ChentsViewController.swift
//  uikit1
//
//  Created by Apple user on 07/11/21.
//

import UIKit

class ChantsViewController: UIViewController {
    
    // MARK: UI
    

    private lazy var tabeVw: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.separatorStyle = .none
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellId)
        return tv
    }()
    
    private lazy var teamsViewModel = TeamsViewModel()
    private lazy var audioManagerViewModel = AudioManagerViewModel()
    // MARK: Lifecicle
    
    override func loadView() {
        super.loadView()
        setup()
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
    }
    
}


private extension ChantsViewController {
    func setup()  {
        
        self.navigationController?.navigationBar.topItem?.title = "Football Chants"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tabeVw.dataSource = self
        self.view.addSubview(tabeVw)
        
        NSLayoutConstraint.activate([
            tabeVw.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tabeVw.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tabeVw.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tabeVw.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
        ])
    }
}

// MARK: UITableViewDataSuorces

extension ChantsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsViewModel.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = teamsViewModel.teams[indexPath.row]
        print(team)
        let cell = tabeVw.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellId, for: indexPath) as! TeamTableViewCell
        cell.configure(with: team, delegate: self)
        return cell
    }
}

extension ChantsViewController: TeamTableViewCellDelegate {
    func didTapPlatblck(for team: Team) {
        audioManagerViewModel.playback(team)
        teamsViewModel.togglePlatback(for: team)
        tabeVw.reloadData()
    }
    
    
}
