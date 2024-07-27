//
//  ExtractDataSource.swift
//  desafio-ios-michelli
//
//  Created by Michelli Cristina de Paulo Lima on 27/07/24.
//

import UIKit

class ExtractDataSource: NSObject {

    override init() {
        super.init()
    }

}

extension ExtractDataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

extension ExtractDataSource: UITableViewDelegate {
    
}
