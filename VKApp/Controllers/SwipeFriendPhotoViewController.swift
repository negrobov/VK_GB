import UIKit

class SwipeFriendPhotoViewController: UIViewController {
    
    @IBOutlet var allFriendPhotoImages: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allFriendPhotoImages.layer.cornerRadius = allFriendPhotoImages.frame.size.width / 2
        allFriendPhotoImages.clipsToBounds = true
        
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.view.backgroundColor = UIColor.clear
        
        let swipeAllFriendPhotoImageGR = UISwipeGestureRecognizer(target: self, action: #selector(allFriendPhotoImagesAnimation))
        swipeAllFriendPhotoImageGR.direction = .right
        swipeAllFriendPhotoImageGR.numberOfTouchesRequired = 1
        allFriendPhotoImages?.addGestureRecognizer(swipeAllFriendPhotoImageGR)
    }
    
    @objc private func allFriendPhotoImagesAnimation() {
        allFriendPhotoImages.image = Friend.generateFriendPhotos()[0]
        UIView.animate(withDuration: 0.1, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.allFriendPhotoImages.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        }, completion: { animate in
            self.returnAllFriendPhotoImages()
        })
    }
    
    private func returnAllFriendPhotoImages(){
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 35, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.allFriendPhotoImages.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        }, completion: nil)
    }
}
