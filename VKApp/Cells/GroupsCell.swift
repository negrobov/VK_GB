import UIKit

class GroupsCell: UITableViewCell {
    
    @IBOutlet var groupNameLabel: UILabel!
    @IBOutlet var groupAvatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        groupAvatarImage.layer.cornerRadius = groupAvatarImage.frame.size.width / 2
        groupAvatarImage.clipsToBounds = true
        
        let tapGroupAvatarImageGR = UITapGestureRecognizer(target: self, action: #selector(groupAvatarImageTapped))
        tapGroupAvatarImageGR.numberOfTapsRequired = 1
        tapGroupAvatarImageGR.numberOfTouchesRequired = 1
        groupAvatarImage?.addGestureRecognizer(tapGroupAvatarImageGR)
    }
    
    @objc private func groupAvatarImageTapped(){
        UIView.animate(withDuration: 0.8, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.groupAvatarImage.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }, completion: { animateAvatar in
            self.returnGroupAvatarImage()
        })
    }
    
    private func returnGroupAvatarImage(){
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 35, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.groupAvatarImage.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        }, completion:  nil)
    }
}
