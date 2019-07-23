import UIKit

class GroupsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    fileprivate var currentGroups = [
        Friend(friendName: "Негробов Иван", friendAvatar: nil),
        Friend(friendName: "Петров Пётр", friendAvatar: nil),
        Friend(friendName:  "Сергеев Сергей", friendAvatar: nil),
        Friend(friendName: "Иванов Иван", friendAvatar: nil),
        Friend(friendName:  "Негробов Вадим", friendAvatar: nil),
        Friend(friendName: "Негробова Юлия", friendAvatar: nil),
        Friend(friendName: "Антонов Антон", friendAvatar: nil),
        Friend(friendName:"Андреев Андрей", friendAvatar: nil),
        Friend(friendName: "Александров Александр", friendAvatar: nil),
        Friend(friendName: "Марков Марк", friendAvatar: nil),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension GroupsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension GroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currentGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as? GroupsCell
            else { fatalError("GroupsCell can't be dequeued") }
        
        cell.friendNameLabel.text = currentGroups[indexPath.row].friendName
        
        return cell
    }
}
