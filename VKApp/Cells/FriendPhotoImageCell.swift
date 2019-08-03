import UIKit

class FriendPhotoImageCell: UICollectionViewCell {
    
    @IBOutlet var friendPhotoImage: UIImageView!
    @IBOutlet var friendPhotoImageLike: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        friendPhotoImage.layer.cornerRadius = friendPhotoImage.frame.size.width / 2
        friendPhotoImage.clipsToBounds = true
        
        let tapLikeGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(friendPhotoImageLikeTapped))
        tapLikeGestureRecognizer.numberOfTapsRequired = 1
        tapLikeGestureRecognizer.numberOfTouchesRequired = 1
        friendPhotoImageLike?.addGestureRecognizer(tapLikeGestureRecognizer)
    }
    
    @objc private func friendPhotoImageLikeTapped() {
        if friendPhotoImageLike?.image == UIImage(named: "Unfilled Like 50") {
            UIView.transition(with: friendPhotoImageLike!, duration: 0.3, options: .transitionCrossDissolve, animations: {
                self.friendPhotoImageLike?.image = UIImage(named: "Filled Like 50")
            }, completion: nil)
        } else {
            UIView.transition(with: friendPhotoImageLike!, duration: 0.3, options: .transitionCrossDissolve, animations: {
                self.friendPhotoImageLike?.image = UIImage(named: "Unfilled Like 50")
            }, completion: nil)
        }
    }
}
