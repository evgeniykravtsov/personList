

import UIKit

class PersonListViewController: UITableViewController {
    private var personList:[Person] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        personList = personListFromDataManager
        tableView.rowHeight = 80
    }
}

extension PersonListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "personCell",
            for: indexPath
        )

        let person = personList[indexPath.row]

        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = person.fullName
    //        content.secondaryText = track.artist
    //        content.image = UIImage(named: track.title)

            cell.contentConfiguration = content
        } else {
            // Fallback on earlier versions
        }

        return cell
    }
}

extension PersonListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? personDetailViewController,
              let indexPath = tableView.indexPathForSelectedRow
        else { return }
        
        let person = personList[indexPath.row]
        vc.person = person
    }
}
