//
//  ViewController.m
//  DevTutorial
//
//  Created by Jianyu ZHU on 26/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "TutorialTableViewController.h"
#import "HTTPService.h"
#import "UIColor+Helpers.h"
#import "VideoCell.h"
#import "Video.h"
#import "VideoViewController.h"

@interface TutorialTableViewController ()

@property (nonatomic, strong) NSArray *videoList;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *topView;

@end

@implementation TutorialTableViewController



-(UIView *) topView {
    if (!_topView) {
        _topView = [[UIView alloc] init];
        _topView.translatesAutoresizingMaskIntoConstraints = NO;
        _topView.backgroundColor = [UIColor colorWithRed:230 Green:32 Blue:31];
        _topView.contentMode = UIViewContentModeScaleToFill;
    }
    return _topView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:VideoCell.class forCellReuseIdentifier:@"VideoCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    [self setupTopView];
    
    [self.view addSubview:self.tableView];
    [self setupTableView];
    
    self.videoList = [[NSArray alloc]init];
    
    [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
        if (dataArray) {
            NSMutableArray *videos = [[NSMutableArray alloc]init];
        
            for (NSDictionary *dic in dataArray) {
                Video *video = [[Video alloc] init];
                video.videoTitle = [dic objectForKey:@"title"];
                video.videoDescription = [dic objectForKey:@"description"];
                video.thumbnailUrl = [dic objectForKey:@"thumbnail"];
                video.videoIframe = [dic objectForKey:@"iframe"];
                
                [videos addObject:video];
            }
            
            self.videoList = videos;
            [self updateTable];
        } else if (errMessage){
            NSLog(@"%@", errMessage);
            
        }
    }];
    
}

-(void) updateTable {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(void)setupTopView {
    [self.topView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.topView.heightAnchor constraintEqualToConstant:84].active = YES;
    [self.topView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.topView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
}

-(void)setupTableView {
    [self.tableView.topAnchor constraintEqualToAnchor:self.topView.bottomAnchor constant: 2].active = YES;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-2].active = YES;
    [self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = (VideoCell*)[tableView dequeueReusableCellWithIdentifier:@"VideoCell"];
    if (!cell)
        cell = [[VideoCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoViewController *vc = [[VideoViewController alloc]init];
    vc.video = [self.videoList objectAtIndex:indexPath.row];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    VideoCell *videoCell = (VideoCell *)cell;
    [videoCell updateUI:video];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 104;
}




@end
