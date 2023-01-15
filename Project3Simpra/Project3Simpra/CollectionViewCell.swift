//
//  CollectionViewCell.swift
//  Project3Simpra
//
//  Created by Furkan Deniz Albaylar on 15.01.2023.
//

import UIKit
class NewsCollectionViewCellModel{
    let title: String
    let subTitle: String
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(title: String, subTitle: String, imageURL: URL?, imageData: Data? = nil) {
        self.title = title
        self.subTitle = subTitle
        self.imageURL = imageURL
        self.imageData = imageData
    }
}

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"

    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureView()
    }
    private func configureView(){
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    func configure(with viewModel: NewsCollectionViewCellModel){
        self.newsTitleLabel?.text = viewModel.title
        self.subTitleLabel?.text = viewModel.subTitle

        if let data = viewModel.imageData{
            self.newsImageView.image = UIImage(data: data)
        }
        else if let url = viewModel.imageURL{
            URLSession.shared.dataTask(with: url){ data,_ , error in
                guard let data = data , error == nil else {
                    return
                }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self.newsImageView?.image = UIImage(data: data)
                }
            }.resume()
        }
    }

}


