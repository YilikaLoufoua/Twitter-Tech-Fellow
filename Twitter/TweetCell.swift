//
//  TweetCell.swift
//  Twitter
//
//  Created by Yilika Loufoua on 3/5/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(true)
            }, failure: { (error) in
                print("Favoriting did not succeed")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(false)
            }, failure: { (error) in
                print("Unfavoriting did not succeed")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        let toBeRetweeted = !retweeted
        if (toBeRetweeted) {
            TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
                self.setRetweeted(true)
            }, failure: { (error) in
                print("Retweeting did not succeed")
            })
        } else {
            TwitterAPICaller.client?.unRetweet(tweetId: tweetId, success: {
                self.setRetweeted(false)
            }, failure: { (error) in
                print("Retweeting did not succeed")
            })
        }
    }
    
    var favorited:Bool = false
    var retweeted:Bool = false
    var tweetId:Int = -1
    
    func setFavorited(_ isFavorited:Bool) {
        favorited = isFavorited
        if (isFavorited) {
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted:Bool) {
        retweeted = isRetweeted
        if (retweeted) {
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
        } else {
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
