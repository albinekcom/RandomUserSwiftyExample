import Foundation

struct PictureFactory {
    
    static func makePicture(from responsePicture: APIResponsePicture?) -> Picture {
        var largeURL: URL?
        
        if let large = responsePicture?.large {
            largeURL = URL(string: large)
        }
        
        var mediumURL: URL?
        
        if let medium = responsePicture?.medium {
            mediumURL = URL(string: medium)
        }
        
        var thumbnailURL: URL?
        
        if let thumbnail = responsePicture?.thumbnail {
            thumbnailURL = URL(string: thumbnail)
        }
        
        return Picture(largeURL: largeURL, mediumURL: mediumURL, thumbnailURL: thumbnailURL)
    }
    
}
