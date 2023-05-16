//
//  ResultsTableViewController.swift
//  Message Center App
//
//  Created by Katelyn Biniak on 5/12/23.
//

import UIKit

class ResultsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var resultsTableView: UITableView!
    
    var messages: [Message]?
    let headerHeight:CGFloat = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsTableView.dataSource = self
        resultsTableView.delegate = self
        
        resultsTableView.register(UINib(nibName: "MessageTableViewCell", bundle: nil), forCellReuseIdentifier: "messageTableViewCell")
        resultsTableView.sectionHeaderTopPadding = 0
    }

    // MARK: Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messages?.count ?? 0
    }
    
    // MARK: Table View Delegate Methods
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: headerHeight))
        headerView.backgroundColor = UIColor.white

        let titleLabel = UILabel()
        titleLabel.frame = CGRect.init(x: 40, y: 0, width: headerView.frame.width-45, height: headerView.frame.height)
        titleLabel.text = "Message Center"
        titleLabel.font = UIFont(name: "Poppins-Bold", size: 16)
        titleLabel.textColor = UIColor.mcDarkBlue

        headerView.addSubview(titleLabel)

        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "messageTableViewCell",
                                                       for: indexPath) as? MessageTableViewCell else { return UITableViewCell() }

        cell.message.text = messages?[indexPath.row].message ?? ""
        if let date = messages?[indexPath.row].date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            guard let messageDate = dateFormatter.date(from: date) else { return cell }
            let formattedMessageDate = DateFormatter.localizedString(from: messageDate,
                                                                     dateStyle: .short,
                                                                     timeStyle: .none)
            cell.date.text = formattedMessageDate
        }

        return cell
    }

}
