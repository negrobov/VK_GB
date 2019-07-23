import UIKit

struct Friend {
    
    let friendName: String
    let friendAvatar: UIImage?
    let photos: [UIImage]
    
    static func generateFriends() -> [Friend] {
        return [
            Friend( friendName: "Chris Evans",  friendAvatar: UIImage(named: "Chris Evans"), photos: generateFriendPhotos()),
            Friend( friendName: "Chris Hemsworth",  friendAvatar: UIImage(named: "Chris Hemsworth"), photos: generateFriendPhotos()),
            Friend( friendName: "Mark Ruffalo",  friendAvatar: UIImage(named: "Mark Ruffalo"), photos: generateFriendPhotos()),
            Friend( friendName: "Robert Downey Jr",  friendAvatar: UIImage(named: "Robert Downey"), photos: generateFriendPhotos()),
            Friend( friendName: "Scarlett Johansson",  friendAvatar: UIImage(named: "Scarlett Johansson"), photos: generateFriendPhotos()),
            Friend( friendName: "Tom Holland",  friendAvatar: UIImage(named: "Tom Holland"), photos: generateFriendPhotos()),
            Friend( friendName: "Tom Hiddlstone",  friendAvatar: UIImage(named: "Tom Hiddlstone"), photos: generateFriendPhotos())
        ]
    }
    //Generating random photos
    static func generateFriendPhotos() ->[UIImage] {
        let images = [
            UIImage(named: "01")!,
            UIImage(named: "02")!,
            UIImage(named: "03")!,
            UIImage(named: "04")!,
            UIImage(named: "05")!,
            UIImage(named: "06")!,
            UIImage(named: "07")!,
            UIImage(named: "08")!,
            UIImage(named: "09")!,
            UIImage(named: "10")!
        ]
        
        let count = Int.random(in: 4...6)
        var totalArr = [UIImage]()
        for _ in 0...count {
            totalArr.append(images.randomElement()!)
        }
        return totalArr
    }
}
