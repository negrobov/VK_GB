import UIKit

class SwipeFriendPhotosViewController: UIViewController {
    
    @IBOutlet var mainFriendPhotoImage: UIImageView!
    @IBOutlet var additionalFriendPhotoImage: UIImageView!
    
    public var photos = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let navigationBar = self.navigationController?.navigationBar
        //        navigationBar?.barStyle = UIBarStyle.black
        mainFriendPhotoImage.image = photos.first
    }
    
    @IBAction func friendPhotImageSwipedLeft(_ sender: UISwipeGestureRecognizer) {
        let friendPhotoImageLeftTransform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
        additionalFriendPhotoImage.image = photos.randomElement()
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {
            self.mainFriendPhotoImage.transform = CGAffineTransform(scaleX: 0.85, y: 0.85).concatenating(friendPhotoImageLeftTransform)
            self.additionalFriendPhotoImage.transform = friendPhotoImageLeftTransform
        }) { _ in
            self.mainFriendPhotoImage.image = self.additionalFriendPhotoImage.image
            self.mainFriendPhotoImage.transform = .identity
            self.additionalFriendPhotoImage.transform = .identity
        }
    }
}
