import UIKit

struct Albums {
    var title: String
    var image: String
}

extension Albums {
    static var albums = [
        
        [Albums(title: "Недавние", image: "person 0"),
         Albums(title: "Instagram", image: "person 1"),
         Albums(title: "Избранное", image: "person 2"),
         Albums(title: "InstaSize", image: "person 3"),
         Albums(title: "WhatsApp", image: "person 4"),
         Albums(title: "Snapseed", image: "person 5"),
         Albums(title: "VSCO", image: "person 6")],
        
        [Albums(title: "Люди", image: "person 7"),
         Albums(title: "Места", image: "georgia")],
        
        [Albums(title: "Видео", image: "video"),
         Albums(title: "Селфи", image: "person.crop.square"),
         Albums(title: "Портреты", image: "cube"),
         Albums(title: "Панорамы", image: "pano"),
         Albums(title: "Серии", image: "square.3.layers.3d.down.right"),
         Albums(title: "Снимки экрана", image: "camera.viewfinder")],
        
        [Albums(title: "Импортированные", image: "square.and.arrow.down"),
         Albums(title: "Скрытые", image: "eye.slash"),
         Albums(title: "Недавно удаленные", image: "trash")]
    ]
    
}
