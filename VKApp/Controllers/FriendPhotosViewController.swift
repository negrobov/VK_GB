import UIKit

class FriendPhotosViewController : UICollectionViewController {
    
    @IBOutlet var friendPhotosCollectionView: UICollectionView!
    
    var photos = [UIImage]()
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarImageCell", for: indexPath) as! FriendPhotoImageCell
        cell.friendPhotoImage.image = photos[indexPath.item]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SwipeFriendPhotos",
            let destinationVC = segue.destination as? SwipeFriendPhotosViewController{
            destinationVC.photos = self.photos
        }
    }
}
