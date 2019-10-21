//
//  ViewController.swift
//  SSS
//
//  Created by 刘鑫鑫 on 2019/10/14.
//  Copyright © 2019 name. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    fileprivate var textView: UITextView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textView = UITextView()
        textView.backgroundColor = .green
        contentView.addSubview(textView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textView.frame = bounds
    }
}

class ViewController: UIViewController {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        

        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(Cell.self, forCellReuseIdentifier: "CELL")
        view.addSubview(tableView)
        
        let button = UIButton(type: .custom)
        button.setTitle("键盘收起", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: tableView.frame.maxY, width: view.frame.width, height: 100)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.blue, for: .highlighted)
        view.addSubview(button)
    }
    
    @objc func buttonAction() {
        self.view.endEditing(true)
    }

    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
