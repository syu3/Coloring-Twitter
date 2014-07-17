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

@implementation irasutoViewController

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
    kaisuu = 0;

    irasuto1.image = [UIImage imageNamed:@"ライオン全身.png"];
    irasuto2.image = [UIImage imageNamed:@"スクリーンショット 2014-07-12 11.07.56.png"];

}
-(IBAction)next{

    kaisuu=kaisuu+1;
    if (kaisuu == 0) {

                             irasuto1.image = [UIImage imageNamed:@"ライオン全身.png"];
                             irasuto2.image = [UIImage imageNamed:@"スクリーンショット 2014-07-12 11.07.56.png"];
 
        
    }else if (kaisuu == 1) {

                             // アニメーションをする処理
                             irasuto1.image = [UIImage imageNamed:@"雪だるま全体１.jpg"];
                             irasuto2.image = [UIImage imageNamed:@"hana.png"];
                         
         
               

        
         }else if(kaisuu == 2){
        irasuto1.image = [UIImage imageNamed:@"スクリーンショット 2014-07-05 23.05.32.png"];
        irasuto2.image = [UIImage imageNamed:@"hikouki.png"];
        
        
    }else{
        kaisuu = 0;
    }
    if (kaisuu == 0) {
        irasuto1.image = [UIImage imageNamed:@"ライオン全身.png"];
        irasuto2.image = [UIImage imageNamed:@"スクリーンショット 2014-07-12 11.07.56.png"];
    }
}@end
