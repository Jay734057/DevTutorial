//
//  HTTPService.h
//  DevTutorial
//
//  Created by Jianyu ZHU on 26/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSArray * __nullable dataDict, NSString * __nullable errMessage);

@interface HTTPService : NSObject

+(id _Nullable ) instance;

-(void)getTutorials: (nullable onComplete) completionHandler;


@end
