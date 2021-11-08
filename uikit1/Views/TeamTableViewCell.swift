//
//  TeamTableViewCell.swift
//  uikit1
//
//  Created by Apple user on 07/11/21.
//

import UIKit

protocol TeamTableViewCellDelegate: class {
    func didTapPlatblck(for team: Team)
}

class TeamTableViewCell: UITableViewCell {

  static let cellId = "TeamTableViewCell"
    
    //MARK: UI
    
    private lazy var containerVw: UIView = {
       let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var contectStackVw: UIStackView = {
        let stackVwv = UIStackView()
        stackVwv.translatesAutoresizingMaskIntoConstraints = false
        stackVwv.spacing = 4
        stackVwv.axis = .vertical
        return stackVwv
    }()
    
    private lazy var badgaImgVw: UIImageView = {
       let imgVw = UIImageView()
        imgVw.translatesAutoresizingMaskIntoConstraints = false
        imgVw.contentMode = .scaleToFill
        return imgVw
    }()
    
    private lazy var playbackBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
       return btn
    }()

    private lazy var nameLbl: UILabel = {
      let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.textColor = .white
        return lbl
    }()
    
    private lazy var foundedLbl: UILabel = {
      let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 12, weight: .light)
        lbl.textColor = .white
        return lbl
    }()

    private lazy var jonLbl: UILabel = {
      let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 10, weight: .light)
        lbl.textColor = .white
        return lbl
    }()
    
    private lazy var infoLbl: UILabel = {
      let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 12, weight: .medium)
        lbl.textColor = .white
        return lbl
    }()
    
    private weak var delegate: TeamTableViewCellDelegate?
    private var team: Team?
    //MARK: Lifecycle
    
    override func layoutSubviews() {
     super.layoutSubviews()
        containerVw.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.team = nil
        self.delegate = nil
        self.contentView.subviews.forEach{ $0.removeFromSuperview() }
    }
    
    func configure(with item: Team, delegate: TeamTableViewCellDelegate) {
        self.team = item
        self.delegate = delegate
        
        playbackBtn.addTarget(self, action: #selector(didTopPlayback), for: .touchUpInside)
        
        containerVw.backgroundColor = item.id.background
        badgaImgVw.image = item.id.badge
        playbackBtn.setImage(item.isPlaying ? Assets.pause : Assets.play, for: .normal)
        
        nameLbl.text = item.name
        foundedLbl.text = item.founded
        jonLbl.text = "Arsenal \(item.manager.job.rawValue):  \(item.manager.name)"
        infoLbl.text = item.info
        
        self.contentView.addSubview(containerVw)
        
        containerVw.addSubview(contectStackVw)
        containerVw.addSubview(badgaImgVw)
        containerVw.addSubview(playbackBtn)
        
        
        contectStackVw.addArrangedSubview(nameLbl)
        contectStackVw.addArrangedSubview(foundedLbl)
        contectStackVw.addArrangedSubview(jonLbl)
        contectStackVw.addArrangedSubview(infoLbl)
        
        NSLayoutConstraint.activate([
            containerVw.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerVw.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            containerVw.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerVw.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            badgaImgVw.heightAnchor.constraint(equalToConstant: 50),
            badgaImgVw.widthAnchor.constraint(equalToConstant: 50),
            badgaImgVw.topAnchor.constraint(equalTo: contectStackVw.topAnchor),
            badgaImgVw.leadingAnchor.constraint(equalTo: containerVw.leadingAnchor, constant: 8),
            
            contectStackVw.topAnchor.constraint(equalTo: containerVw.topAnchor, constant: 16),
            contectStackVw.bottomAnchor.constraint(equalTo: containerVw.bottomAnchor, constant: -16),
            contectStackVw.leadingAnchor.constraint(equalTo: badgaImgVw.leadingAnchor, constant: 55),
            contectStackVw.trailingAnchor.constraint(equalTo: playbackBtn.trailingAnchor, constant: -30),
            
            playbackBtn.heightAnchor.constraint(equalToConstant: 44),
            playbackBtn.widthAnchor.constraint(equalToConstant: 44),
            playbackBtn.trailingAnchor.constraint(equalTo: containerVw.trailingAnchor, constant: -8),
            playbackBtn.centerYAnchor.constraint(equalTo: containerVw.centerYAnchor)
        ])
        
    }
    
    @objc func didTopPlayback(){
        if let team = team {
            delegate?.didTapPlatblck(for: team)
        }
    }
}
