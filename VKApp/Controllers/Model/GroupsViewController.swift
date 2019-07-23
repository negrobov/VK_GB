import UIKit

class GroupsViewController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var groupSearchBar: UISearchBar!
    
    var searchedGroup: [String] = []
    var searching = false
    var currentGroups = [
        Group(groupName: "New Balance",  groupAvatar: UIImage(named: "New Balance")),
        Group(groupName: "MORGENSHTERN",  groupAvatar: nil),
        Group(groupName: "GeekBrains",  groupAvatar: nil),
        Group(groupName:  "Apple",  groupAvatar: nil),
        Group(groupName: "Category B", groupAvatar: nil),
        Group(groupName: "Being American", groupAvatar: nil),
        Group(groupName:"Reddit",  groupAvatar: nil)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Adding group from AllGroupsViewController
    @IBAction func addGroup(segue: UIStoryboardSegue){
        guard let allGroupsVC = segue.source as? AllGroupsViewController,
            let indexPath = allGroupsVC.tableView.indexPathForSelectedRow
            else { return }
        
        let newGroup =  allGroupsVC.allGroups[indexPath.row]
        guard !currentGroups.contains(where: {group -> Bool in
            group.groupName == newGroup.groupName
        }) else { return }
        
        currentGroups.append(newGroup)
        tableView.reloadData()
    }
}
extension GroupsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension GroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return  searchedGroup.count
        } else {
            return currentGroups.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as? GroupsCell
            else { fatalError("GroupsCell can't be dequeued") }
        cell.groupNameLabel?.text = currentGroups[indexPath.row].groupName
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            currentGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
//Almost made search bar
extension GroupsViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedGroup =  currentGroups.map { $0.groupName }.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        
        searching = true
        tableView.reloadData()
    }
    
}
