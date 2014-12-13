//
//  RegesiterVC.m
//  MyLoginTest
//
//  Created by lanou3g on 14-12-12.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "RegesiterVC.h"
#import "User.h"
#import "AppDelegate.h"
@interface RegesiterVC ()<UIApplicationDelegate>

@end

@implementation RegesiterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _userNameLabel.text = _userNameString;
    //
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)regesiterAction:(id)sender {
    int num = 0;
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"User"];
    for (User *user in [self.managedObjectContext executeFetchRequest:request error:nil] ) {
        
        
        if ([user.userName isEqualToString:_userNameLabel.text]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"该用户名已经存在" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            [alert show];
            num = 1;
            break;
        }
    }
    if (num == 0) {
        
        if ( [_passWDLabel.text isEqualToString:@""] || [_rePassWDLabel.text isEqualToString:@""]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"请输入用户名密码" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            [alert show];
        }
        else if ( ![_rePassWDLabel.text isEqualToString: _passWDLabel.text]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"两次密码不一致" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            [alert show];
        }
        
        else
        {
            User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];
            user.passWord = _passWDLabel.text;
            user.userName = _userNameLabel.text;
            [self.managedObjectContext save:nil];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"通知" message:@"注册成功😄" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    
}

//清空所有用户信息

- (IBAction)clearAction:(id)sender {
    
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"User"];
    for (User *user in [self.managedObjectContext executeFetchRequest:request error:nil] ) {
        [self.managedObjectContext deleteObject:user];
        
    }
    [self.managedObjectContext save:nil];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"清理成功😊" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
    [alert show];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
