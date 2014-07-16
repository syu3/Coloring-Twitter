//
//  hyoujouViewController.m
//  試し
//
//  Created by 加藤 周 on 2014/07/14.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "hyoujouViewController.h"

@interface hyoujouViewController ()

@end

@implementation hyoujouViewController

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
    number = 0;
    hyoujou1.image = [UIImage imageNamed:@"雪だるま"];
    hyoujou2.image = [UIImage imageNamed:@"雪だるま2"];
    
    
}
-(IBAction)next{
    
    number=number+1;
    if (number == 0) {
        hyoujou1.image = [UIImage imageNamed:@"雪だるま"];
        hyoujou2.image = [UIImage imageNamed:@"雪だるま2"];
        
    }else if (number == 1) {
        hyoujou1.image = [UIImage imageNamed:@"雪だるま3.png"];
        hyoujou2.image = [UIImage imageNamed:@"雪だるま4.png"];
        
    }else if(number == 2){
        hyoujou1.image = [UIImage imageNamed:@"雪だるま5.png"];
        hyoujou2.image = [UIImage imageNamed:@"雪だるま6.png"];
        
        
    }else if(number == 3){
        hyoujou2.image = [UIImage imageNamed:@"雪だるま7.png"];
    }else{
        number = 0;
    }
    if (number == 0) {
        hyoujou1.image = [UIImage imageNamed:@"雪だるま.png"];
        hyoujou2.image = [UIImage imageNamed:@"雪だるま.png"];
    }
}
@end
