import UIKit

class AllGroupsViewController: UITableViewController {
    
    var allGroups = [
        Group(groupName: "EuropaPlus", groupAvatar: nil),
        Group(groupName: "WWF", groupAvatar: nil),
        Group(groupName:  "Кино Кайф", groupAvatar: nil),
        Group(groupName: "MARVEl", groupAvatar: nil),
        Group(groupName: "Папка с картинками", groupAvatar: nil),
        Group(groupName:"Папка с твитами", groupAvatar: nil),
        Group(groupName: "Я - Программист", groupAvatar: nil)
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as! AllGroupsCell
        
        cell.allGroupsNameLabel?.text = allGroups[indexPath.row].groupName
        cell.allGroupsImage?.image = UIImage(named: "NegrobovIvanAvatar")
        
        return cell
    }
}
