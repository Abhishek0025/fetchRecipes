import SwiftUI

class ImageCache {
    static let shared = NSCache<NSString, UIImage>() //Creates a shared in-memory cache for storing images, reducing redundant downloads and prevents unnecessary network requests.
}

struct AsyncImageView: View {
    let url: String?
    @State private var image: UIImage?
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
                    .onAppear { loadImage() }
            }
        }
        .frame(width: 50, height: 50)
    }
    
    private func loadImage() {
        guard let urlString = url, let imageURL = URL(string: urlString) else { return }
        
        if let cachedImage = ImageCache.shared.object(forKey: urlString as NSString) {
            image = cachedImage
            return
        }
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: imageURL)
                if let downloadedImage = UIImage(data: data) {
                    ImageCache.shared.setObject(downloadedImage, forKey: urlString as NSString)
                    DispatchQueue.main.async {
                        image = downloadedImage
                    }
                }
            } catch {
                print("Failed to load image: \(error)")
            }
        }
    }
}

