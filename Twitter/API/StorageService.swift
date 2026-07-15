//
//  StorageService.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/15/26.
//

import FirebaseStorage
import UIKit

struct StorageService {
    private init() {}

    static func upload(
        _ image: UIImage,
        forUserId userId: String
    ) async throws -> URL {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            throw NetworkingError.serverError(
                "Image data could not be compressed."
            )
        }

        let filename = UUID().uuidString
        let ref = Storage.storage().reference(
            withPath: "/images/\(userId)/\(filename)"
        )

        let _ = try await ref.putDataAsync(imageData)

        return try await ref.downloadURL()
    }
}
