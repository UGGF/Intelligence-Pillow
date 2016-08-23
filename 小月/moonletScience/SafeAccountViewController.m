//
//  SafeAccountViewController.m
//  moonletScience
//
//  Created by Zhuge_Su on 16/4/13.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import "SafeAccountViewController.h"
#import "SafeAccountTableViewCell.h"
#import "BindingAccountViewController.h"
#import "changePSWVC.h"
#import "ThirdChangePwdViewController.h"
#import "loginVC.h"

@interface SafeAccountViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_array;
}
@end

@implementation SafeAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WHITECOLOR;
    [self createNavBar];
    _array = @[@"账户绑定",@"修改密码"];
    [self creatTableView];
}




-(void)createNavBar
{
#pragma mark - 修改状态栏的简便方法 
    //状态栏设置
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 20)];
    statusBarView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:statusBarView];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //导航栏图片
    UIImageView *navBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, WIDTH, 50)];
    navBar.userInteractionEnabled = YES;
    //navBar.image = [UIImage imageNamed:@"navbg.png"];
    navBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navBar];
    
    //导航栏字体
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH / 2 - 50 , 10, 100, 30)];
    title.text = @"账户与安全";
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

#pragma mark - tableView视图
- (void)creatTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, WIDTH, 110)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"SafeAccountTableViewCell";
    SafeAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:cellID owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.MyLable.text = _array[indexPath.row];
    cell.MyLable.font = [UIFont systemFontOfSize:15];
    cell.MyLable.textColor = RGBCOLOR(85, 95, 100);
    
    for (int i = 0; i < 3; i++) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, i*50, WIDTH, 2)];
        line.backgroundColor = SLIVERYCOLOR;
        [_tableView addSubview:line];
    }
 
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            session *danli = [session getInstance];
            if (danli.isLogoin) {
                BindingAccountViewController *binding = [[BindingAccountViewController alloc]init];
                [self.navigationController pushViewController:binding animated:YES];

            }else{
                loginVC *login = [[loginVC alloc]init];
                [self.navigationController pushViewController:login animated:YES];
            }

            
        }
            break;
        case 1:
        {
//            changePSWVC *change = [[changePSWVC alloc]init];
//            [self.navigationController pushViewController:change animated:YES];
            ThirdChangePwdViewController *third = [[ThirdChangePwdViewController alloc]init];
            [self.navigationController pushViewController:third animated:YES];
        }
            break;
        default:
            break;
    }

}


#pragma mark - 退出当前账号视图
- (void)createExitView{
    UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    exitBtn.frame = CGRectMake(20, HEIGHT/4*3, WIDTH-40, 40);
    exitBtn.backgroundColor = TEXTTINTCOLOR;
    exitBtn.layer.cornerRadius = 3;
    exitBtn.clipsToBounds = YES;
    exitBtn.adjustsImageWhenHighlighted = NO;
    [exitBtn setTitle:@"退出当前账号" forState:UIControlStateNormal];
    [exitBtn setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
    exitBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [exitBtn addTarget:self action:@selector(exitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:exitBtn];
}

- (void)exitBtnClick{
    
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
