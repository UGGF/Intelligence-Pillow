//
//  UnBindingViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/14.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "UnBindingViewController.h"
#import "BindingAccountViewController.h"

@interface UnBindingViewController ()

@end

@implementation UnBindingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self createBindingMail];
}

//** 下面状态栏修改的进阶版 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


-(void)createNavBar
{
#pragma mark - 修改状态栏的简便方法
    //导航栏图片
    UIImageView *navBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
    navBar.userInteractionEnabled = YES;
    //navBar.image = [UIImage imageNamed:@"navbg.png"];
    navBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navBar];
    
    //导航栏字体
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"我的设置";
    title.textColor = TEXTCOLOR;
    title.font = [UIFont systemFontOfSize:18];
    title.textAlignment = NSTextAlignmentCenter;
    [navBar addSubview:title];
    
    //导航返回键
    UIButton *fanHuiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [fanHuiBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    fanHuiBtn.frame = CGRectMake(0, 0, 100, 50);
    [fanHuiBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 60)];
    [fanHuiBtn addTarget:self action:@selector(fanhui) forControlEvents:UIControlEventTouchUpInside];
    //fanHuiBtn.backgroundColor = [UIColor blackColor];
    [navBar addSubview:fanHuiBtn];
    
}

- (void)fanhui
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - 绑定的邮箱视图
- (void)createBindingMail{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UIImageView *mailIma = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2-86, 70+60, 173, 130)];
    [mailIma setImage:[UIImage imageNamed:@"Mailbox_binding.png"]];
    [self.view addSubview:mailIma];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(20 , 70+60+130+40, 100, 30)];
    title.text = @"绑定的邮箱:";
    title.textColor = TEXTCOLOR;
    title.font = [UIFont systemFontOfSize:16];
//    title.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:title];
    
    UILabel *mailLab = [[UILabel alloc]initWithFrame:CGRectMake(120 , 70+60+130+40, WIDTH-120-10, 30)];
    mailLab.text = @"zhuge_mo@qq.com";
    mailLab.textColor = TEXTCOLOR;
    mailLab.font = [UIFont systemFontOfSize:16];
//    mailLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:mailLab];
    
    UIButton *unBindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    unBindBtn.frame = CGRectMake(20, 70+60+130+40+30+50, WIDTH-40, 40);
    unBindBtn.backgroundColor = TEXTTINTCOLOR;
    unBindBtn.alpha = 0.7;
    unBindBtn.layer.cornerRadius = 3;
    unBindBtn.clipsToBounds = YES;
    [unBindBtn setTitle:@"解绑邮箱" forState:UIControlStateNormal];
    [unBindBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    unBindBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [unBindBtn addTarget:self action:@selector(unBindBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //fanHuiBtn.backgroundColor = [UIColor blackColor];
    [self.view addSubview:unBindBtn];
    
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, HEIGHT-70, WIDTH-20, 30)];
    lab.text = @"绑定邮箱可以保障您的账户安全，当您的手机无法接收验证码时，可通过此处绑定的邮箱重新绑定手机。";
    lab.numberOfLines = 0;
    lab.textColor = TEXTTINTCOLOR;
    lab.font = [UIFont systemFontOfSize:12];
    //    lab.textAlignment = NSTextAlignmentCenter;
    lab.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lab];
    
}

- (void)unBindBtnClick{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"解绑邮箱将对您的账户安全产生隐患\n确定解绑吗?" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //待定---------------------传说中的分割线---------------------------------待定
        [self.navigationController popViewControllerAnimated:YES];

        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
