import UIKit

class AllGroupsCell: UITableViewCell {
    
    @IBOutlet var allGroupsImage: UIImageView!
    @IBOutlet var allGroupsNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        allGroupsImage.layer.cornerRadius = allGroupsImage.frame.size.width / 2
        allGroupsImage.clipsToBounds = true
    }
}
