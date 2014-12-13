//
//  MainVC.m
//  MyLoginTest
//
//  Created by lanou3g on 14-12-12.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "MainVC.h"
#import "RegesiterVC.h"
#import "LoginVC.h"
#import "User.h"
#import "AppDelegate.h"
@interface MainVC ()<UITextFieldDelegate>

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    _userNameLabel.delegate = self;
    _passWordLabel.delegate = self;
    
//    [self textFieldDidEndEditing:_userNameLabel];
//    [self textFieldDidEndEditing:_passWordLabel];

    
//    NSLog(@"uddd____%@",[_ud objectForKey:@"userName"]);

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([segue.identifier isEqualToString:@"mySegue"]) {

        //属性传值
        id pageRegesiter = segue.destinationViewController;
        [pageRegesiter setValue:self.userNameLabel.text forKey:@"userNameString"];
        NSLog(@" -.- ");
    }
    
}


- (IBAction)loginAction:(id)sender {
    int num = 0;
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"User"];
    for (User *user in [self.managedObjectContext executeFetchRequest:request error:nil]) {
        if ([_userNameLabel.text isEqualToString:user.userName] && [_passWordLabel.text isEqualToString:user.passWord]) {
            
            
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"LoginSt"];
            [self presentViewController:vc animated:YES completion:nil];

            
            num = 1;
        }
        
    }
    
    if (num == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"无该账户名密码或者存在错误" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
    
}


-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
    NSString *userNameString = [NSString stringWithFormat:@"%@",_userNameLabel.text];
    NSString *passWordString = [NSString stringWithFormat:@"%@",_passWordLabel.text];
    _ud = [NSUserDefaults standardUserDefaults];
    
    [_ud setObject:userNameString forKey:@"userName"];
    [_ud setObject:passWordString forKey:@"passWord"];
    
    //同步文件,否则程序正常退出的时候,信息将不会被保存
    [_ud synchronize];
//    NSLog(@"/*/ %@",[_ud objectForKey:@"userName"]);
    
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
