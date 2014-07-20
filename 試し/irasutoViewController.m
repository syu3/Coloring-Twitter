//
//  irasutoViewController.m
//  試し
//
//  Created by 加藤 周 on 2014/07/14.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "irasutoViewController.h"

@interface irasutoViewController ()

@end

@implementation irasutoViewController{
        int number;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    irasuto1.image = [UIImage imageNamed:@"スクリーンショット 2014-07-12 20.03.27.png"];
    irasuto2.image = [UIImage imageNamed:@"ライオン　顔.png"];

}
-(IBAction)next{
    NSLog(@"ok");
    number = number+1;
    NSLog(@"%d",number);
               UIView *view2 = [[UIView alloc] initWithFrame:self.view.bounds];
    if (number == 1) {
 
        [self.view addSubview:view2];
        
        // 追加と同時に行うとアニメーションしないので、サンプルでは処理をちょっとだけ遅延させています
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_MSEC));
        
        dispatch_after(time, dispatch_get_main_queue(), ^{
            [UIView transitionFromView:irasuto1 toView:irasuto2 duration:1.0 options:UIViewAnimationOptionTransitionCurlUp completion:^(BOOL finished) {
                
                irasuto1.image = [UIImage imageNamed:@"雪だるま全体１.jpg"];
                irasuto2.image = [UIImage imageNamed:@"hana.png"];
                
                NSLog(@"Animation end.");
                
            }];
            
        });

    }
    if(number == 2){
        NSLog(@"反応しているよ");
        UIView *view3 = [[UIView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:view2];
        [self.view addSubview:view3];
        
        // 追加と同時に行うとアニメーションしないので、サンプルでは処理をちょっとだけ遅延させています
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_MSEC));
        
        dispatch_after(time, dispatch_get_main_queue(), ^{
            [UIView transitionFromView:view2 toView:view3 duration:1.0 options:UIViewAnimationOptionTransitionCurlUp completion:^(BOOL finished) {
                
                irasuto1.image = [UIImage imageNamed:@"スクリーンショット 2014-07-05 23.05.32.png"];
                irasuto2.image = [UIImage imageNamed:@"hana.png"];
                
                NSLog(@"Animation end.");
            }];
        });
    
    }
            
}
@end
