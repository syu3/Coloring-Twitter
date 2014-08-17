//
//  ExpressionViewController.m
//  試し
//
//  Created by 加藤 周 on 2014/08/11.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ExpressionViewController.h"
#import "IllustrationViewController.h"


@interface ExpressionViewController ()

@end

@implementation ExpressionViewController

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
    Expressionbutton.alpha = 0.0;
    Expressionback.alpha = 0.0;
    
    
    switch (hyojo) {
        case 0:
            Expression1.image = [UIImage imageNamed:@"ライオン　１笑顔.png"];
            Expression2.image = [UIImage imageNamed:@"ライオン　2笑顔.png"];
            Expression3.image = [UIImage imageNamed:@"ライオン　3ムスッと.png"];
            Expression4.image = [UIImage imageNamed:@"ライオン　4怒.png"];
            Expression5.image = [UIImage imageNamed:@"ライオン　5ニコニコ.png"];
            Expression6.image = [UIImage imageNamed:@"ライオン　6泣.png"];

            break;
        case 1:
            Expression1.image = [UIImage imageNamed:@"ゾウ　１笑顔.png"];
            Expression2.image = [UIImage imageNamed:@"ゾウ　2笑顔.png"];
            Expression3.image = [UIImage imageNamed:@"ゾウ　3ムスッと.png"];
            Expression4.image = [UIImage imageNamed:@"ゾウ　4怒.png"];
            Expression5.image = [UIImage imageNamed:@"ゾウ　5ニコニコ.png"];
            Expression6.image = [UIImage imageNamed:@"ゾウ　６泣.png"];
            Expression7.image = [UIImage imageNamed:@"ゾウ　7泣.png"];
            break;
        case 2:
            Expression1.image = [UIImage imageNamed:@"ひまわり　１笑顔.png"];
            Expression2.image = [UIImage imageNamed:@"ひまわり　2笑顔.png"];
            Expression3.image = [UIImage imageNamed:@"ひまわり　3ムスッと.png"];
            Expression4.image = [UIImage imageNamed:@"ひまわり　4ニコニコ.png"];
            Expression5.image = [UIImage imageNamed:@"ひまわり　5怒.png"];
            Expression6.image = [UIImage imageNamed:@"ひまわり　6焦.png"];
            Expression7.image = [UIImage imageNamed:@"ひまわり　7泣.png"];
            break;
        case 3:
            Expression1.image = [UIImage imageNamed:@"雪だるま全身　１笑顔.png"];
            Expression2.image = [UIImage imageNamed:@"雪だるま全身　2笑顔.png"];
            Expression3.image = [UIImage imageNamed:@"雪だるま全身　3ムスッと.png"];
            Expression4.image = [UIImage imageNamed:@"雪だるま全身　4.png"];
            Expression5.image = [UIImage imageNamed:@"雪だるま全身　5怒.png"];
            Expression6.image = [UIImage imageNamed:@"雪だるま全身　6焦.png"];
            Expression7.image = [UIImage imageNamed:@"雪だるま全身　７泣.png"];
            break;
        case 4:
            Expression1.image = [UIImage imageNamed:@"飛行機　１笑顔.png"];
            Expression2.image = [UIImage imageNamed:@"飛行機　2笑顔.png"];
            Expression3.image = [UIImage imageNamed:@"飛行機　3ムスッと.png"];
            Expression4.image = [UIImage imageNamed:@"飛行機　4ニコニコ.png"];
            Expression5.image = [UIImage imageNamed:@"飛行機　5怒.png"];
            Expression6.image = [UIImage imageNamed:@"飛行機　6泣.png"];
            Expression7.image = [UIImage imageNamed:@"飛行機　7焦.png"];
            break;
        case 5:
            Expression1.image = [UIImage imageNamed:@"車　１笑顔.png"];
            Expression2.image = [UIImage imageNamed:@"車　2笑顔.png"];
            Expression3.image = [UIImage imageNamed:@"車　3ムスッと.png"];
            Expression4.image = [UIImage imageNamed:@"車　4.png"];
            Expression5.image = [UIImage imageNamed:@"車　5怒.png"];
            Expression6.image = [UIImage imageNamed:@"車　6焦.png"];
            Expression7.image = [UIImage imageNamed:@"車　7泣.png"];
            break;
   
        default:
            break;
    }
    
    

}
-(IBAction)back{
    kaisu1 = kaisu1 - 1;
    if (kaisu1 == 0) {
        [UIView animateWithDuration:1 animations:^{
            Expressionbutton.alpha = 0.0;
            Expressionback.alpha = 0.0;
        }];
    }else if (kaisu1 == 1){

                Expressionbutton1.alpha = 1.0;
                Expressionnext.alpha = 1.0;

    }else if (kaisu1 == 2){
        [UIView animateWithDuration:1 animations:^{
            [UIView animateWithDuration:1 animations:^{
                Expressionbutton1.alpha = 1.0;
                Expressionnext.alpha = 1.0;
            }];
        }];
    }
    UIViewAnimationOptions animeOptions = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx = Expression1.center.x;
    CGFloat cy = Expression1.center.y;
    CGPoint pt = CGPointMake(cx+480,cy);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions
                     animations:^{
                         Expression1.center = pt;
                     }
                     completion:nil];
    UIViewAnimationOptions animeOptions1 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx1 = Expression2.center.x;
    CGFloat cy1 = Expression2.center.y;
    CGPoint pt1 = CGPointMake(cx1+480,cy1);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions1
                     animations:^{
                         Expression2.center = pt1;
                     }
                     completion:nil];
    UIViewAnimationOptions animeOptions2 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx2 = Expression3.center.x;
    CGFloat cy2 = Expression3.center.y;
    CGPoint pt2 = CGPointMake(cx2+480,cy2);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions2
                     animations:^{
                         Expression3.center = pt2;
                     }
                     completion:nil];
    UIViewAnimationOptions animeOptions3 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx3 = Expression4.center.x;
    CGFloat cy3 = Expression4.center.y;
    CGPoint pt3 = CGPointMake(cx3+480,cy3);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions3
                     animations:^{
                         Expression4.center = pt3;
                         
                     }
                     completion:nil];
    
    UIViewAnimationOptions animeOptions4 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx4 = Expression5.center.x;
    CGFloat cy4 = Expression5.center.y;
    CGPoint pt4 = CGPointMake(cx4+480,cy4);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions4
                     animations:^{
                         Expression5.center = pt4;
                         
                     }
                     completion:nil];
    
    
    
    
    
    
    UIViewAnimationOptions animeOptions5 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx5 = Expression6.center.x;
    CGFloat cy5 = Expression6.center.y;
    CGPoint pt5 = CGPointMake(cx5+480,cy5);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions5
                     animations:^{
                         Expression6.center = pt5;
                         
                         
                     }
                     completion:nil];
  
    
    
    
    
    UIViewAnimationOptions animeOptions6 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx6 = Expression7.center.x;
    CGFloat cy6 = Expression7.center.y;
    CGPoint pt6 = CGPointMake(cx6+480,cy6);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions6
                     animations:^{
                         Expression7.center = pt6;
                         
                         
                     }
                     completion:nil];
    
    
}

-(IBAction)next{
    kaisu1 = kaisu1 +1;
    if (kaisu1 == 1) {
        
        
        [UIView animateWithDuration:1 animations:^{
            Expressionbutton.alpha = 1.0;
            Expressionback.alpha = 1.0;
            
        }];
        
    }else if (kaisu1 == 2){
        Expressionbutton.alpha = 1.0;
        Expressionback.alpha = 1.0;
    }else if (kaisu1 == 3){
        [UIView animateWithDuration:1 animations:^{
            Expressionbutton1.alpha = 0.0;
            Expressionnext.alpha = 0.0;
        }];
        
    }
    
    UIViewAnimationOptions animeOptions = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx = Expression1.center.x;
    CGFloat cy = Expression1.center.y;
    CGPoint pt = CGPointMake(cx-480,cy);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions
                     animations:^{
                         Expression1.center = pt;
                         
                     }
                     completion:nil];
    
    
    
    
    
    
    UIViewAnimationOptions animeOptions1 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx1 = Expression2.center.x;
    CGFloat cy1 = Expression2.center.y;
    CGPoint pt1 = CGPointMake(cx1-480,cy1);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions1
                     animations:^{
                         Expression2.center = pt1;
                         
                     }
                     completion:nil];
    
    
    
    
    
    
    
    
    
    UIViewAnimationOptions animeOptions2 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx2 = Expression3.center.x;
    CGFloat cy2 = Expression3.center.y;
    CGPoint pt2 = CGPointMake(cx2-480,cy2);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions2
                     animations:^{
                         Expression3.center = pt2;
                         
                     }
                     completion:nil];
    
    
    
    
    
    
    
    
    UIViewAnimationOptions animeOptions3 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx3 = Expression4.center.x;
    CGFloat cy3 = Expression4.center.y;
    CGPoint pt3 = CGPointMake(cx3-480,cy3);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions3
                     animations:^{
                         Expression4.center = pt3;
                         
                     }
                     completion:nil];
    
    
    
    
    
    
    
    
    UIViewAnimationOptions animeOptions4 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx4 = Expression5.center.x;
    CGFloat cy4 = Expression5.center.y;
    CGPoint pt4 = CGPointMake(cx4-480,cy4);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions4
                     animations:^{
                         Expression5.center = pt4;
                         
                     }
                     completion:nil];
    
    
    
    
    
    
    UIViewAnimationOptions animeOptions5 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx5 = Expression6.center.x;
    CGFloat cy5 = Expression6.center.y;
    CGPoint pt5 = CGPointMake(cx5-480,cy5);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions5
                     animations:^{
                         Expression6.center = pt5;
                         
                         
                     }
                     completion:nil];
    if (hyojo == 1&&hyojo == 2&&hyojo == 3&&hyojo == 4&&hyojo == 5) {

    
    UIViewAnimationOptions animeOptions6 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx6 = Expression7.center.x;
    CGFloat cy6 = Expression7.center.y;
    CGPoint pt6 = CGPointMake(cx6-480,cy6);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions6
                     animations:^{
                         Expression7.center = pt6;
                         
                         
                     }
                     completion:nil];
    }
    
    
}
@end
