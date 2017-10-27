//
//  VideoViewController.h
//  DevTutorial
//
//  Created by Jianyu ZHU on 27/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic,strong) Video *video;
@end
