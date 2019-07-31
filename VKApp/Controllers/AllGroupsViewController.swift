import UIKit

class AllGroupsViewController: UITableViewController {
    
    var allGroups = Group.generateAllGroups()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as! AllGroupsCell
        cell.allGroupsNameLabel?.text = allGroups[indexPath.row].groupName
        cell.allGroupsImage?.image = allGroups[indexPath.row].groupAvatar
        
        return cell
    }
}
