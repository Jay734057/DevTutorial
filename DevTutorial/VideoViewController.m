//
//  VideoViewController.m
//  DevTutorial
//
//  Created by Jianyu ZHU on 27/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import "VideoViewController.h"
#import "UIColor+Helpers.h"
#import "Video.h"

@interface VideoViewController ()

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIButton *doneButton;

@end

@implementation VideoViewController



-(UIWebView *)webView {
    if (!_webView){
        _webView = [[UIWebView alloc] init];
        _webView.translatesAutoresizingMaskIntoConstraints = NO;
        _webView.delegate = self;
    }
    return _webView;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold];
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.numberOfLines = 2;
    }
    
    return _titleLabel;
}

-(UILabel *)descLabel {
    if(!_descLabel) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _descLabel.font = [UIFont systemFontOfSize:17];
        _descLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _descLabel.numberOfLines = 5;
    }
    return _descLabel;
}

-(UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _doneButton.translatesAutoresizingMaskIntoConstraints = NO;
        _doneButton.backgroundColor = [UIColor colorWithRed:244 Green:67 Blue:54];
        [_doneButton setTitle:@"DONE" forState:UIControlStateNormal];
        [_doneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_doneButton.titleLabel setFont:[UIFont systemFontOfSize:21 weight:UIFontWeightHeavy]];
        [_doneButton addTarget:self action:@selector(handleDoneButtonPress) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.webView];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.descLabel];
    [self.view addSubview:self.doneButton];
    
    [self setupView];
    
    self.titleLabel.text = self.video.videoTitle;
    self.descLabel.text = self.video.videoDescription;
    [self.webView loadHTMLString:self.video.videoIframe baseURL:nil];
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *css = @".container {position: relative; width: 100%; height: 0; padding-bottom: 56.25%; } .video { position: absolute; top: 0; left: 0; width: 100%; height: 100%;}";
    
    NSString* js = [NSString stringWithFormat:
                    @"var styleNode = document.createElement('style');\n"
                    "styleNode.type = \"text/css\";\n"
                    "var styleText = document.createTextNode('%@');\n"
                    "styleNode.appendChild(styleText);\n"
                    "document.getElementsByTagName('head')[0].appendChild(styleNode);\n",css];
    
    [webView stringByEvaluatingJavaScriptFromString:js];
}


-(void)setupView {
    [self.webView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.webView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.webView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.webView.heightAnchor constraintEqualToConstant:274].active = YES;
    
    [self.titleLabel.topAnchor constraintEqualToAnchor:self.webView.bottomAnchor constant:15].active = YES;
    [self.titleLabel.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:16].active = YES;
    [self.titleLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-16].active = YES;
    [self.titleLabel.heightAnchor constraintEqualToConstant:51].active = YES;
    
    [self.descLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:18].active = YES;
    [self.descLabel.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:16].active = YES;
    [self.descLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-16].active = YES;
    [self.descLabel.heightAnchor constraintEqualToConstant:100].active = YES;
    
    [self.doneButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20].active = YES;
    [self.doneButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:16].active = YES;
    [self.doneButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-16].active = YES;
    [self.doneButton.heightAnchor constraintEqualToConstant:53].active = YES;
    
}


-(void)handleDoneButtonPress{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
