//
//  VideoCell.m
//  DevTutorial
//
//  Created by Jianyu ZHU on 27/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "VideoCell.h"
#import "Video.h"

@interface VideoCell()

@property (nonatomic, strong) UIView *cellView;
@property (nonatomic, strong) UIImageView *thumbImg;
@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UILabel *descLbl;
@property (nonatomic, strong) UIView *bottomView;

@end


@implementation VideoCell



-(UIView *)cellView {
    if (!_cellView) {
        _cellView = [[UIView alloc] init];
        _cellView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _cellView;
}

-(UIImageView *)thumbImg {
    if (!_thumbImg) {
        _thumbImg = [[UIImageView alloc] init];
        _thumbImg.translatesAutoresizingMaskIntoConstraints = NO;
        _thumbImg.contentMode = UIViewContentModeScaleToFill;
        _thumbImg.clipsToBounds = YES;
    }
    return _thumbImg;
}

-(UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLbl.font = [UIFont boldSystemFontOfSize:12];
        _titleLbl.numberOfLines = 2;
    }
    return _titleLbl;
}

-(UILabel *)descLbl {
    if(!_descLbl) {
        _descLbl = [[UILabel alloc] init];
        _descLbl.translatesAutoresizingMaskIntoConstraints = NO;
        _descLbl.font = [UIFont systemFontOfSize:12];
        _descLbl.numberOfLines = 3;
    }
    return _descLbl;
}

-(UIView *)bottomView {
    if(!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor lightGrayColor];
        _bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _bottomView;
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
    [self addSubview:self.cellView];
    [self setupCell];
    
    [self.cellView addSubview:self.thumbImg];
    [self.cellView addSubview:self.titleLbl];
    [self.cellView addSubview:self.descLbl];
    [self.cellView addSubview:self.bottomView];
    [self setupContentView];
}

-(void)setupCell {
    [self.cellView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.cellView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [self.cellView.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
    [self.cellView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
}

-(void)setupContentView {
    [self.thumbImg.topAnchor constraintEqualToAnchor:self.cellView.topAnchor constant:8].active = YES;
    [self.thumbImg.bottomAnchor constraintEqualToAnchor:self.cellView.bottomAnchor constant:-8].active = YES;
    [self.thumbImg.leftAnchor constraintEqualToAnchor:self.cellView.leftAnchor constant:8].active = YES;
    [self.thumbImg.widthAnchor constraintEqualToConstant:126].active = YES;
    
    [self.titleLbl.topAnchor constraintEqualToAnchor:self.cellView.topAnchor constant:8].active = YES;
    [self.titleLbl.leftAnchor constraintEqualToAnchor:self.thumbImg.rightAnchor constant:4].active = YES;
    [self.titleLbl.rightAnchor constraintEqualToAnchor:self.cellView.rightAnchor constant:-8].active = YES;
    [self.titleLbl.heightAnchor constraintEqualToConstant: 34].active = YES;
    
    [self.descLbl.topAnchor constraintEqualToAnchor:self.titleLbl.bottomAnchor constant:4].active = YES;
    [self.descLbl.leftAnchor constraintEqualToAnchor:self.thumbImg.rightAnchor constant:4].active = YES;
    [self.descLbl.rightAnchor constraintEqualToAnchor:self.cellView.rightAnchor constant:-8].active = YES;
    [self.descLbl.bottomAnchor constraintEqualToAnchor:self.cellView.bottomAnchor constant:-8].active = YES;
    
    [self.bottomView.bottomAnchor constraintEqualToAnchor:self.cellView.bottomAnchor].active = YES;
    [self.bottomView.rightAnchor constraintEqualToAnchor:self.cellView.rightAnchor constant:-8].active = YES;
    [self.bottomView.leftAnchor constraintEqualToAnchor:self.cellView.leftAnchor constant:8].active = YES;
    [self.bottomView.heightAnchor constraintEqualToConstant:1].active = YES;

    
}

-(void)updateUI: (nonnull Video*) video {
    self.titleLbl.text = video.videoTitle;
    self.descLbl.text = video.videoDescription;
    NSLog(@"VID: %@",video.videoDescription);

    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:video.thumbnailUrl]]];
    self.thumbImg.image = image;
}

@end
