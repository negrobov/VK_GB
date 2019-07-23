import UIKit

class FriendPhotoImageCell: UICollectionViewCell {
    
    @IBOutlet var friendPhotoImage: UIImageView!
    @IBOutlet var friendPhotoImageLike: UIImageView?
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        friendPhotoImage.layer.cornerRadius = friendPhotoImage.frame.size.width / 2
        friendPhotoImage.clipsToBounds = true
        
        let tapLikeGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        tapLikeGestureRecognizer.numberOfTapsRequired = 1
        tapLikeGestureRecognizer.numberOfTouchesRequired = 1
        
        friendPhotoImageLike?.addGestureRecognizer(tapLikeGestureRecognizer)
    }
    
    @objc func likeTapped() {
        if friendPhotoImageLike?.image == UIImage(named: "Unfilled Like 50") {
            friendPhotoImageLike?.image = UIImage(named: "Filled Like 50")
        } else {
            friendPhotoImageLike?.image = UIImage(named: "Unfilled Like 50")
        }
    }
}
