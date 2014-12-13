//
//  MainVC.h
//  MyLoginTest
//
//  Created by Dearyyy on 14-12-12.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *userNameLabel;
@property (strong, nonatomic) IBOutlet UITextField *passWordLabel;
@property (strong, nonatomic) IBOutlet UIButton *loginLabel;
@property (strong, nonatomic) IBOutlet UIButton *regesiterLabel;

@property (nonatomic,retain) NSManagedObjectContext *managedObjectContext;


@property(nonatomic,retain)NSUserDefaults *ud;

@end
