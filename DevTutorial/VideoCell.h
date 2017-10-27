//
//  VideoCell.h
//  DevTutorial
//
//  Created by Jianyu ZHU on 27/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoCell : UITableViewCell

-(id _Nonnull )init;
-(id _Nonnull )initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *_Nullable)reuseIdentifier;

-(void)updateUI:(nonnull Video*)video;

@end
