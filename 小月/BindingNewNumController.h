//
//  BindingNewNumController.h
//  moonletScience
//
//  Created by Zhuge_Su on 16/8/10.
//  Copyright © 2016年 moonletScience. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BindingNewNumController : UIViewController
{
    int time;
}
@property(nonatomic,strong)UILabel *lab;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)UIView *myview;
@property(nonatomic,strong)UITextField *num ;
@end
