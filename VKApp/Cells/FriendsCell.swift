import UIKit

class FriendsCell: UITableViewCell {
    
    @IBOutlet var friendAvatarImage: UIImageView!
    @IBOutlet var friendNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        friendAvatarImage.layer.cornerRadius = friendAvatarImage.frame.size.width / 2
        friendAvatarImage.clipsToBounds = true
        
        let tapFriendAvatarImageGR = UITapGestureRecognizer(target: self, action: #selector(friendAvatarImageTapped))
        tapFriendAvatarImageGR.numberOfTapsRequired = 1
        tapFriendAvatarImageGR.numberOfTouchesRequired = 1
        friendAvatarImage?.addGestureRecognizer(tapFriendAvatarImageGR)
        
    }
    
    @objc private func friendAvatarImageTapped() {
        UIView.animate(withDuration: 0.8, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.friendAvatarImage.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }, completion: { animateAvatar in
            self.returnFriendAvatarImage()
        })
    }
    
    private func returnFriendAvatarImage() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 35, options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.friendAvatarImage.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        }, completion:  nil)
    }
}
