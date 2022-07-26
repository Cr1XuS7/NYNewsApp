//
//  ViewController.swift
//  NYNewsApp--CodingChallenge--ChristopherBoyajian
//
//  Created by Christopher Boyajian on 22/07/2022.
//

import UIKit
import SafariServices
import Network

class ViewController: UIViewController {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    let parser = Parser()
    var results = [Results]()
    let monitor = NWPathMonitor()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if !Reachability.isConnectedToNetwork() {
            
            print("Internet connection FAILED")
            let alert = UIAlertController(title: "Network Connection",
                    message: "Please connect to the internet and try again.",
                    preferredStyle: .alert)
            self.present(alert, animated: true, completion:nil)
        }
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        monitor.start(queue: queue)
        
        parser.parse(){
            data in
            self.results = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! NewsCell
        cell.titleLabel?.text = results[indexPath.row].title
        cell.bylineLabel?.text = results[indexPath.row].byline
        cell.publisheddateLabel?.text = results[indexPath.row].published_date
        
        cell.buttonAction = { [unowned self] in
            guard let targetURL = URL(string: "\(results[indexPath.row].url)")
                                      else {
                return
            }
        let safariVC = SFSafariViewController(url: targetURL)
            present(safariVC, animated: true, completion: nil)
            
            
    }
        return cell
}
}

