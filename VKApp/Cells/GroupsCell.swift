import UIKit

class GroupsCell: UITableViewCell {
    
    @IBOutlet var groupNameLabel: UILabel!
    @IBOutlet var groupAvatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        groupAvatarImage.layer.cornerRadius = groupAvatarImage.frame.size.width / 2
        groupAvatarImage.clipsToBounds = true
    }
}
