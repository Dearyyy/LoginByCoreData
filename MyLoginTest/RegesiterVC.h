//
//  RegesiterVC.h
//  MyLoginTest
//
//  Created by Dearyyy on 14-12-12.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface RegesiterVC : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userNameLabel;
@property (strong, nonatomic) IBOutlet UITextField *passWDLabel;
@property (strong, nonatomic) IBOutlet UITextField *rePassWDLabel;
@property (strong, nonatomic) IBOutlet UIButton *regesiterButton;
@property (nonatomic,retain) NSManagedObjectContext *managedObjectContext;
//传值练习
@property(nonatomic,copy)NSString *userNameString;

@property (strong, nonatomic) IBOutlet UIButton *clearButton;

@end

