import UIKit

class personDetailViewController: UIViewController {
    var person:Person?

    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = person?.fullName
        emailLabel.text = person?.email
        phoneLabel.text = person?.phone
    }
    

}
