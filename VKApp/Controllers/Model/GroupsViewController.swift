import UIKit

class GroupsViewController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var groupSearchBar: UISearchBar!
    
    lazy var searchedGroup = self.currentGroups
    var currentGroups = Group.generateGroups()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue){
        guard let allGroupsVC = segue.source as? AllGroupsViewController,
            let indexPath = allGroupsVC.tableView.indexPathForSelectedRow
            else { return }
        
        let newGroup =  allGroupsVC.allGroups[indexPath.row]
        guard !currentGroups.contains(where: {group -> Bool in
            group.groupName == newGroup.groupName
        }) else { return }
        
        currentGroups.append(newGroup)
        filterGroups(with: groupSearchBar.text!)
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
        
        return searchedGroup.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as? GroupsCell
            else { fatalError("GroupsCell can't be dequeued") }
        cell.groupNameLabel?.text = searchedGroup[indexPath.row].groupName
        cell.groupAvatarImage?.image = searchedGroup[indexPath.row].groupAvatar
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let currentGroupToDelete = searchedGroup[indexPath.row]
            searchedGroup.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            currentGroups.removeAll() { group -> Bool in
                group.groupName == currentGroupToDelete.groupName
                
            }
        }
    }
}

extension GroupsViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filterGroups(with: searchText)
    }
    
    fileprivate func filterGroups(with text: String){
        if text.isEmpty {
            searchedGroup = currentGroups
            tableView.reloadData()
            
            return
        }
        searchedGroup = currentGroups.filter { $0.groupName.lowercased().contains(text.lowercased()) }
        tableView.reloadData()
    }
}
