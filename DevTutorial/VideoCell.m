//
//  VideoCell.m
//  DevTutorial
//
//  Created by Jianyu ZHU on 27/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "VideoCell.h"
#import "Video.h"

@implementation VideoCell

UIView *cellView;

-(UIView *)cellView {
    cellView = [[UIView alloc] init];
    cellView.translatesAutoresizingMaskIntoConstraints = NO;
    return cellView;
}

UILabel *titleLbl;

-(UILabel *)titleLbl {
    titleLbl = [[UILabel alloc] init];
    titleLbl.translatesAutoresizingMaskIntoConstraints = NO;
    titleLbl.font = [UIFont boldSystemFontOfSize:12];
    titleLbl.lineBreakMode = NSLineBreakByWordWrapping;
    titleLbl.numberOfLines = 2;
//    titleLbl.backgroundColor = [UIColor redColor];
    return titleLbl;
}

UILabel *descLbl;

-(UILabel *)descLbl {
    descLbl = [[UILabel alloc] init];
    descLbl.translatesAutoresizingMaskIntoConstraints = NO;
    descLbl.font = [UIFont systemFontOfSize:12];
    descLbl.lineBreakMode = NSLineBreakByWordWrapping;
    descLbl.numberOfLines = 3;
//    descLbl.backgroundColor = [UIColor blueColor];
    return descLbl;
}

UIView *bottomView;

-(UIView *)bottomView {
    bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    return bottomView;
}


UIImageView *thumbImg;

-(UIImageView *)thumbImg {
    thumbImg = [[UIImageView alloc] init];
    thumbImg.translatesAutoresizingMaskIntoConstraints = NO;
    thumbImg.contentMode = UIViewContentModeScaleToFill;
    thumbImg.clipsToBounds = YES;
//    thumbImg.layer.cornerRadius = 36;
//    thumbImg.backgroundColor = [UIColor greenColor];
    return thumbImg;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.cornerRadius = 2.0;
    self.layer.shadowColor = [UIColor colorWithRed:157/255 green:157/255 blue:157/255 alpha:0.8].CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 5;
    self.layer.shadowOffset = CGSizeMake(0, 2);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)init {
    self = [super init];
    if (self){
        [self setupView];
    }
    return self;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        [self setupView];
    }
    return self;
}

-(void)setupView {
    [self addSubview:[self cellView]];
    [self setupCell];
    
    [cellView addSubview:[self thumbImg]];
    [cellView addSubview:[self titleLbl]];
    [cellView addSubview:[self descLbl]];
    [cellView addSubview:[self bottomView]];
    [self setupContentView];
}

-(void)setupCell {
    [cellView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [cellView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [cellView.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
    [cellView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
}

-(void)setupContentView {
    [thumbImg.topAnchor constraintEqualToAnchor:cellView.topAnchor constant:8].active = YES;
    [thumbImg.bottomAnchor constraintEqualToAnchor:cellView.bottomAnchor constant:-8].active = YES;
    [thumbImg.leftAnchor constraintEqualToAnchor:cellView.leftAnchor constant:8].active = YES;
    [thumbImg.widthAnchor constraintEqualToConstant:126].active = YES;
    
    [titleLbl.topAnchor constraintEqualToAnchor:cellView.topAnchor constant:8].active = YES;
    [titleLbl.leftAnchor constraintEqualToAnchor:thumbImg.rightAnchor constant:4].active = YES;
    [titleLbl.rightAnchor constraintEqualToAnchor:cellView.rightAnchor constant:-8].active = YES;
    [titleLbl.heightAnchor constraintEqualToConstant:34].active = YES;
    
    [descLbl.topAnchor constraintEqualToAnchor:titleLbl.bottomAnchor constant:4].active = YES;
    [descLbl.leftAnchor constraintEqualToAnchor:thumbImg.rightAnchor constant:4].active = YES;
    [descLbl.rightAnchor constraintEqualToAnchor:cellView.rightAnchor constant:-8].active = YES;
    [descLbl.bottomAnchor constraintEqualToAnchor:cellView.bottomAnchor constant:-8].active = YES;
    
    [bottomView.bottomAnchor constraintEqualToAnchor:cellView.bottomAnchor].active = YES;
    [bottomView.rightAnchor constraintEqualToAnchor:cellView.rightAnchor constant:-8].active = YES;
    [bottomView.leftAnchor constraintEqualToAnchor:cellView.leftAnchor constant:8].active = YES;
    [bottomView.heightAnchor constraintEqualToConstant:1].active = YES;

    
}

-(void)updateUI: (nonnull Video*) video {
    titleLbl.text = video.videoTitle;
    descLbl.text = video.videoDescription;
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:video.thumbnailUrl]]];
    thumbImg.image = image;
}

@end
