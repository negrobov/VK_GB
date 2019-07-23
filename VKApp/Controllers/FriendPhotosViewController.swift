import UIKit

class FriendPhotosViewController : UICollectionViewController {
    
    @IBOutlet var friendPhotosCollectionView: UICollectionView!
    
    var photos = [UIImage]()
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarImageCell", for: indexPath) as! FriendPhotoImageCell
        cell.friendPhotoImage.image = photos[indexPath.item]
        
        return cell
    }
}
