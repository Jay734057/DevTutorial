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

@interface TutorialTableViewController ()

@property (nonatomic, strong) NSArray *videoList;

@end

@implementation TutorialTableViewController

UIView *topView;

-(UIView *) topView {
    topView = [[UIView alloc] init];
    
    if (topView) {
        topView.translatesAutoresizingMaskIntoConstraints = NO;
        topView.backgroundColor = [UIColor colorWithRed:230 Green:32 Blue:31];
        topView.contentMode = UIViewContentModeScaleToFill;
    }
    
    return topView;
}

UITableView *tableView;

-(UITableView *) tableView {
    tableView = [[UITableView alloc] init];
    
    if (tableView) {
        tableView.translatesAutoresizingMaskIntoConstraints = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:[self topView]];
    [self setupTopView];
    
    [self.view addSubview:[self tableView]];
    [self setupTableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:VideoCell.class forCellReuseIdentifier:@"VideoCell"];

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

        }
    }];
    
}

-(void) updateTable {
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(void)setupTopView {
    [topView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [topView.heightAnchor constraintEqualToConstant:84].active = YES;
    [topView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [topView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
}

-(void)setupTableView {
    [tableView.topAnchor constraintEqualToAnchor:topView.bottomAnchor constant: 2].active = YES;
    [tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-2].active = YES;
    [tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCell"];
    if (!cell)
        cell = [[VideoCell alloc] init];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    VideoCell *videoCell = (VideoCell *)cell;
    [videoCell updateUI:video];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 106;
}




@end
