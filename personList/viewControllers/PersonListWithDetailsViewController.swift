

import UIKit

class PersonListWithDetailsViewController: UITableViewController {
    private var personList:[Person] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        personList = personListFromDataManager
        tableView.rowHeight = 80
    }
}

extension PersonListWithDetailsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        personList.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return personList[section].fullName
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "personCellWithDetails",
            for: indexPath
        )

        let person = personList[indexPath.section]

        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            
            content.text = person.email
            content.secondaryText = person.phone
            

            cell.contentConfiguration = content
        } else {
            // Fallback on earlier versions
        }

        return cell
    }
}

extension PersonListWithDetailsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? personDetailViewController,
              let indexPath = tableView.indexPathForSelectedRow
        else { return }
        
        let person = personList[indexPath.row]
        vc.person = person
    }
}
