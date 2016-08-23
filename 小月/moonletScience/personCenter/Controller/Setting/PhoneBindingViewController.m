//
//  PhoneBindingViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/14.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "PhoneBindingViewController.h"
#import "PhoneChangeViewController.h"

@interface PhoneBindingViewController ()

@end

@implementation PhoneBindingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    [self creatContentView];
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
    title.text = @"手机号已绑定";
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

#pragma maek - 内容视图
- (void)creatContentView{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 2)];
    line.backgroundColor = SLIVERYCOLOR;
    [self.view addSubview:line];
    
    UIImageView *imagView = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2-60, 110, 109 , 188)];
//    imagView.backgroundColor =REDCOLOR;
    [imagView setImage:[UIImage imageNamed:@"iphonebinding.png"]];
    [self.view addSubview:imagView];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(30, 340, (WIDTH-60)/2, 20)];
    lab.text = @"绑定的手机号:";
    lab.font = [UIFont systemFontOfSize:15];
    lab.textColor = BLACKTEXTCOLOR;
    lab.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:lab];
    
   
    UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2, 340, (WIDTH-60)/2, 20)];
    numLab.textColor = BLACKTEXTCOLOR;
    numLab.text = @"15868458961";
    numLab.textAlignment = NSTextAlignmentLeft;
    lab.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:numLab];
    
    UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    changeBtn.frame = CGRectMake(20, HEIGHT/2+100, WIDTH-40, 40);
    changeBtn.backgroundColor = TEXTTINTCOLOR;
    changeBtn.adjustsImageWhenHighlighted = NO;
    [changeBtn setTitle:@"更换手机号" forState:UIControlStateNormal];
    [changeBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    changeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    changeBtn.layer.cornerRadius = 3;
    changeBtn.clipsToBounds = YES;
    [changeBtn addTarget:self action:@selector(changeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeBtn];
}

- (void)changeBtnClick{
    PhoneChangeViewController *change = [[PhoneChangeViewController alloc]init];
    [self.navigationController pushViewController:change animated:YES];
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
