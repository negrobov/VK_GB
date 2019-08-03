import UIKit

struct Group {
    
    let groupName: String
    let groupAvatar: UIImage?
    
    static func generateGroups() -> [Group] {
        return [
            Group( groupName: "New Balance",  groupAvatar: UIImage(named: "New Balance")),
            Group( groupName: "Папка с картинками",  groupAvatar: UIImage(named: "Папка с картинками")),
            Group( groupName: "Being American",  groupAvatar: UIImage(named: "Being American")),
            Group( groupName: "MORGENSHTERN",  groupAvatar: UIImage(named: "MORGENSHTERN")),
            Group( groupName: "MARVEL DC",  groupAvatar: UIImage(named: "MARVEL DC")),
            Group( groupName: "Папка с твитами",  groupAvatar: UIImage(named: "Папка с твитами")),
            Group( groupName: "Наукоградъ",  groupAvatar: UIImage(named: "Наукоградъ"))
        ]
    }
    
    static func generateAllGroups() -> [Group] {
        return [
            Group( groupName: "REAL",  groupAvatar: UIImage(named: "REAl")),
            Group( groupName: "Reddit",  groupAvatar: UIImage(named: "Reddit")),
            Group( groupName: "НЕОРИГИНАЛЬНО",  groupAvatar: UIImage(named: "НЕОРИГИНАЛЬНО")),
            Group( groupName: "lmao",  groupAvatar: UIImage(named: "lmao")),
            Group( groupName: "Котизм",  groupAvatar: UIImage(named: "Котизм")),
            Group( groupName: "Оружие человечества",  groupAvatar: UIImage(named: "Оружие чеовечества")),
            Group( groupName: "Я - программист",  groupAvatar: UIImage(named: "Я - программист"))
        ]
    }
}
