import UIKit

class FriendsCell: UITableViewCell {
    
    @IBOutlet var friendAvatarImage: UIImageView!
    @IBOutlet var friendNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        friendAvatarImage.layer.cornerRadius = friendAvatarImage.frame.size.width / 2
        friendAvatarImage.clipsToBounds = true
    }
}
