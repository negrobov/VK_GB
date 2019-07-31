import UIKit

class FriendsViewController: UITableViewController {
    
    var currentFriends = Friend.generateFriends()
    var firstCharacters = [Character]()
    var sortedFriends: [Character: [Friend]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (firstCharacters, sortedFriends) = sort(currentFriends)
        tableView.tableFooterView = UIView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return firstCharacters.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let character = firstCharacters[section]
        let friendsCount = sortedFriends[character]?.count
        
        return friendsCount ?? 0
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsCell
            else { preconditionFailure("FriendsCell can't be dequeued") }
        
        cell.friendNameLabel?.text = currentFriends[indexPath.row].friendName
        
        if currentFriends[indexPath.row].friendAvatar == nil {
            cell.friendAvatarImage?.image = UIImage(named: "Friends50")
        } else {
            cell.friendAvatarImage?.image = currentFriends[indexPath.row].friendAvatar
        }
        
        let character = firstCharacters[indexPath.section]
        if let currentFriends = sortedFriends[character] {
            cell.friendNameLabel.text = currentFriends[indexPath.row].friendName
            cell.friendAvatarImage.image = currentFriends[indexPath.row].friendAvatar
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let character = firstCharacters[section]
        
        return String(character)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriendPhotosSegue",
            let indexPath = tableView.indexPathForSelectedRow,
            let photoVC = segue.destination as? FriendPhotosViewController {
            let friend = currentFriends[indexPath.row]
            let photos = friend.photos
            photoVC.photos = photos
        }
    }
    
    private func sort(_ currentSortingFriends: [Friend]) -> (characters: [Character], sortedFriends: [Character: [Friend]]) {
        
        var characters = [Character]()
        var sortedFriends = [Character: [Friend]]()
        
        currentSortingFriends.forEach { friend in
            guard let character = friend.friendName.first else { return }
            if var thisCharFriends = sortedFriends[character] {
                thisCharFriends.append(friend)
                sortedFriends[character] = thisCharFriends
            } else {
                sortedFriends[character] = [friend]
                characters.append(character)
            }
        }
        characters.sort()
        
        return (characters, sortedFriends)
    }
}
