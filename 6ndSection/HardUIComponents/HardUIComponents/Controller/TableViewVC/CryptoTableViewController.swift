//
//  CryptoTableViewController.swift
//  HardUIComponents
//
//  Created by Sabir Myrzaev on 09.02.2022.
//

import UIKit
import SnapKit

class CryptoTableViewController: UIViewController {
    
    // MARK: - Properties
    var crypts = [Crypt]()
    
    // MARK: - Views and Layout properties
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Портфолио"
        title.font = UIFont.systemFont(ofSize: 38, weight: .bold)
        title.textAlignment = .left
        
        view.addSubview(title)
        
        title.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.left.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        return title
    }()
    
    private lazy var settingButton: UIButton = {
        let shape = UIButton()
        shape.setImage(UIImage(systemName: "gearshape"), for: .normal)
        shape.tintColor = UIColor.lightGray
        
        view.addSubview(shape)
        shape.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        
        shape.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY).offset(-10)
            $0.right.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        return shape
    }()
    
    private lazy var showAllButton: UIButton = {
        let showAll = UIButton(type: .system)
        showAll.setTitle("посмотреть всё", for: .normal)
        showAll.setTitleColor(UIColor.systemRed, for: .normal)
        showAll.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .thin)
        
        view.addSubview(showAll)
        showAll.addTarget(self, action: #selector(showAllCrypt), for: .touchUpInside)
        
        showAll.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.right.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        return showAll
    }()
    
    lazy var windowTableView: UITableView = {
        let window = UITableView()
        window.backgroundColor = UIColor(named: "PrimaryBackground")
        window.separatorStyle = .none
        
        view.addSubview(window)
        window.delegate = self
        window.dataSource = self
        
        window.register(CryptCustomTableViewCell.self, forCellReuseIdentifier: CryptCustomTableViewCell.identifier)
        
        window.snp.makeConstraints {
            $0.top.equalTo(showAllButton.snp.bottom).offset(10)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        return window
    }()
    
    // list ours elements view
    private lazy var listLayoutViews = [titleLabel, settingButton, showAllButton, windowTableView]
    
    // MARK: - Lifecycle VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "PrimaryBackground")
        
        // pass to every elements for show on screen
        let _ = listLayoutViews.compactMap { $0 }
        
        // addd elements from another array
        crypts += CryptValues.values
        
        // remove lines if we don't have cell with data
        windowTableView.tableFooterView = UIView(frame: .zero)
    }
    
    // MARK: - @objc func
    @objc func showSettings() {
        print("Setting")
    }
    
    @objc func showAllCrypt() {
        print("Show all")
    }
}
