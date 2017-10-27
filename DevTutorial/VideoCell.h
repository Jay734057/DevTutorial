//
//  VideoCell.h
//  DevTutorial
//
//  Created by Jianyu ZHU on 27/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

@interface VideoCell : UITableViewCell

-(id)init;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

-(void)updateUI:(nonnull Video*)video;

@end
