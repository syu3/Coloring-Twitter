//
//  IllustrationViewController.m
//  試し
//
//  Created by 加藤 周 on 2014/08/11.
//  Copyright (c) 2014年 mycompany. All rights reserved.
#import "IllustrationViewController.h"
#import "ExpressionViewController.h"


@interface IllustrationViewController ()
@end
@implementation IllustrationViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    button.alpha = 0.0;
    back.alpha = 0.0;



        illustrationButton1.alpha = 1.0;
        illustrationButton2.alpha = 1.0;
        illustrationButton3.alpha = 0.0;
        illustrationButton4.alpha = 0.0;
        illustrationButton5.alpha = 0.0;
        illustrationButton6.alpha = 0.0;
    
}
-(IBAction)illustrationButton1{
    
    NSLog(@"illustrationButton1");

    hyojo = 1;
    illustration1.image = [UIImage imageNamed:@"ライオン　１笑顔イラスト.png"];
    illustration2.image = [UIImage imageNamed:@"ゾウ　１笑顔イラスト.png"];

    

}
-(IBAction)illustrationButton2{
        NSLog(@"illustrationButton2");

    hyojo = 2;
    illustration1.image = [UIImage imageNamed:@"ライオン　１笑顔イラスト.png"];
    illustration2.image = [UIImage imageNamed:@"ゾウ　１笑顔イラスト.png"];


}
-(IBAction)illustrationButton3{
        NSLog(@"illustrationButton3");
    hyojo = 3;
    
    illustration1.image = [UIImage imageNamed:@"ひまわり　１笑顔イラスト.png"];
    illustration2.image = [UIImage imageNamed:@"雪だるま全身　１笑顔イラスト.png"];


}
-(IBAction)illustrationButton4{
        NSLog(@"illustrationButton4");
    hyojo = 4;
    
    illustration1.image = [UIImage imageNamed:@"ひまわり　１笑顔イラスト.png"];
    illustration2.image = [UIImage imageNamed:@"雪だるま全身　１笑顔イラスト.png"];
    


}
-(IBAction)illustrationButton5{
        NSLog(@"illustrationButton5");
    hyojo = 5;
    
    illustration1.image = [UIImage imageNamed:@"飛行機　１笑顔イラスト.png"];
    illustration2.image = [UIImage imageNamed:@"車　１笑顔イラスト.png"];
    


}
-(IBAction)illustrationButton6{
        NSLog(@"illustrationButton6");
    hyojo = 6;
    
    illustration1.image = [UIImage imageNamed:@"飛行機　１笑顔イラスト.png"];
    illustration2.image = [UIImage imageNamed:@"車　１笑顔イラスト.png"];

}
-(IBAction)back{

    kaisu1 = kaisu1 - 1;
    if (kaisu1 == 0) {
        illustrationButton1.alpha = 1.0;
        illustrationButton2.alpha = 1.0;
        illustrationButton3.alpha = 0.0;
        illustrationButton4.alpha = 0.0;
        illustrationButton5.alpha = 0.0;
        illustrationButton6.alpha = 0.0;

        
        
        [UIView animateWithDuration:1 animations:^{
            button.alpha = 0.0;
            back.alpha = 0.0;
            
            
            

            
            
            
            
        }];
    }else if (kaisu1 == 1){

        illustrationButton1.alpha = 0.0;
        illustrationButton2.alpha = 0.0;
        illustrationButton3.alpha = 1.0;
        illustrationButton4.alpha = 1.0;
        illustrationButton5.alpha = 0.0;
        illustrationButton6.alpha = 0.0;


                button1.alpha = 1.0;
                next.alpha = 1.0;
            
    }
    UIViewAnimationOptions animeOptions = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx = illustration1.center.x;
    CGFloat cy = illustration1.center.y;
    CGPoint pt = CGPointMake(cx+480,cy);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions
                     animations:^{
                         illustration1.center = pt;
                     }
                     completion:nil];
    
    
    
    
    
    
    
    
    UIViewAnimationOptions animeOptions1 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx1 = illustration2.center.x;
    CGFloat cy1 = illustration2.center.y;
    CGPoint pt1 = CGPointMake(cx1+480,cy1);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions1
                     animations:^{
                         illustration2.center = pt1;
                     }
                     completion:nil];
    UIViewAnimationOptions animeOptions2 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx2 = illustration3.center.x;
    CGFloat cy2 = illustration3.center.y;
    CGPoint pt2 = CGPointMake(cx2+480,cy2);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions2
                     animations:^{
                         illustration3.center = pt2;
                     }
                     completion:nil];
    UIViewAnimationOptions animeOptions3 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx3 = illustration4.center.x;
    CGFloat cy3 = illustration4.center.y;
    CGPoint pt3 = CGPointMake(cx3+480,cy3);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions3
                     animations:^{
                         illustration4.center = pt3;
                         
                     }
                     completion:nil];

    UIViewAnimationOptions animeOptions4 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx4 = illustration5.center.x;
    CGFloat cy4 = illustration5.center.y;
    CGPoint pt4 = CGPointMake(cx4+480,cy4);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions4
                     animations:^{
                         illustration5.center = pt4;
                         
                     }
                     completion:nil];
    
    
    
    
    
    
    UIViewAnimationOptions animeOptions5 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx5 = illustration6.center.x;
    CGFloat cy5 = illustration6.center.y;
    CGPoint pt5 = CGPointMake(cx5+480,cy5);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions5
                     animations:^{
                         illustration6.center = pt5;
                         
                         
                     }
                     completion:nil];

}
-(IBAction)next{

    kaisu1 = kaisu1 +1;
    if (kaisu1 == 1) {
        illustrationButton1.alpha = 0.0;
        illustrationButton2.alpha = 0.0;
        illustrationButton3.alpha = 1.0;
        illustrationButton4.alpha = 1.0;
        illustrationButton5.alpha = 0.0;
        illustrationButton6.alpha = 0.0;
        
        [UIView animateWithDuration:1 animations:^{
            button.alpha = 1.0;
            back.alpha = 1.0;

        }];

    }else if (kaisu1 == 2){
        illustrationButton1.alpha = 0.0;
        illustrationButton2.alpha = 0.0;
        illustrationButton3.alpha = 0.0;
        illustrationButton4.alpha = 0.0;
        illustrationButton5.alpha = 1.0;
        illustrationButton6.alpha = 1.0;
        [UIView animateWithDuration:1 animations:^{
            button1.alpha = 0.0;
            next.alpha = 0.0;
        }];

    }
    
UIViewAnimationOptions animeOptions = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx = illustration1.center.x;
    CGFloat cy = illustration1.center.y;
    CGPoint pt = CGPointMake(cx-480,cy);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions
                     animations:^{
                         illustration1.center = pt;

                     }
                     completion:nil];
    
    
    
    
    
    
    UIViewAnimationOptions animeOptions1 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx1 = illustration2.center.x;
    CGFloat cy1 = illustration2.center.y;
    CGPoint pt1 = CGPointMake(cx1-480,cy1);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions1
                     animations:^{
                         illustration2.center = pt1;
                         
                     }
                     completion:nil];
    
    
    
    
    
    
    
    
    
    UIViewAnimationOptions animeOptions2 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx2 = illustration3.center.x;
    CGFloat cy2 = illustration3.center.y;
    CGPoint pt2 = CGPointMake(cx2-480,cy2);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions2
                     animations:^{
                         illustration3.center = pt2;
                         
                     }
                     completion:nil];
    
    
    
    
    
    
    
    
    UIViewAnimationOptions animeOptions3 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx3 = illustration4.center.x;
    CGFloat cy3 = illustration4.center.y;
    CGPoint pt3 = CGPointMake(cx3-480,cy3);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions3
                     animations:^{
                         illustration4.center = pt3;
                         
                     }
                     completion:nil];
    
    
    
    
    
    
    
    
    UIViewAnimationOptions animeOptions4 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx4 = illustration5.center.x;
    CGFloat cy4 = illustration5.center.y;
    CGPoint pt4 = CGPointMake(cx4-480,cy4);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions4
                     animations:^{
                         illustration5.center = pt4;
                         
                     }
                     completion:nil];
    
    
    
    
    
    
    UIViewAnimationOptions animeOptions5 = UIViewAnimationOptionCurveEaseInOut;
    CGFloat cx5 = illustration6.center.x;
    CGFloat cy5 = illustration6.center.y;
    CGPoint pt5 = CGPointMake(cx5-480,cy5);
    [UIView animateWithDuration:1.5
                          delay:0
                        options:animeOptions5
                     animations:^{
                         illustration6.center = pt5;

                         
                     }
                     completion:nil];

    
}
//    float newValue;
//    if (illustration1.alpha == 1.0) {
//
//    }else{
//
//    }
//    [UIView animateWithDuration:1 animations:^{
//
//    }];
//    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    kaisu = kaisu + 1;
//    if (kaisu == 1) {
//        [ UIView beginAnimations: @"TransitionAnimation" context:nil ];
//        // トランジションアニメーションを設定
//        [ UIView setAnimationTransition: UIViewAnimationTransitionCurlUp
//                                forView:illustration1
//                                  cache:YES ];
//        // imageViewの画像を差し替える
//        illustration1.animationDuration = 5.0f;
//        illustration1.image = [UIImage imageNamed:@"スクリーンショット 2014-07-28 9.24.57.png" ];
//        // アニメーションを開始
//        [ UIView commitAnimations ];
//        
//        
//        
//        //~illustration2の始まりここから~
//        
//        [ UIView beginAnimations: @"TransitionAnimation" context:nil ];
//        
//        // トランジションアニメーションを設定
//        [ UIView setAnimationTransition: UIViewAnimationTransitionCurlUp
//                                forView: illustration2
//                                  cache:YES ];
//        
//        
//        // imageViewの画像を差し替える
//        illustration2.animationDuration = 5.0f;
//        illustration2.image = [UIImage imageNamed:@"スクリーンショット 2014-07-12 13.23.08.png" ];
//        
//        // アニメーションを開始
//        [ UIView commitAnimations ];
//    }else if (kaisu == 2){
//        [ UIView beginAnimations: @"TransitionAnimation" context:nil ];
//        // トランジションアニメーションを設定
//        [ UIView setAnimationTransition: UIViewAnimationTransitionCurlUp
//                                forView:illustration1
//                                  cache:YES ];
//        // imageViewの画像を差し替える
//        illustration1.animationDuration = 5.0f;
//        illustration1.image = [UIImage imageNamed:@"スクリーンショット 2014-07-12 13.23.08.png" ];
//        // アニメーションを開始
//        [ UIView commitAnimations ];
//        
//        
//        
//        //~illustration2の始まりここから~
//        
//        [ UIView beginAnimations: @"TransitionAnimation" context:nil ];
//        
//        // トランジションアニメーションを設定
//        [ UIView setAnimationTransition: UIViewAnimationTransitionCurlUp
//                                forView: illustration2
//                                  cache:YES ];
//        
//        
//        // imageViewの画像を差し替える
//        illustration2.animationDuration = 5.0f;
//        illustration2.image = [UIImage imageNamed:@"スクリーンショット 2014-07-28 9.24.57.png" ];
//        
//        // アニメーションを開始
//        [ UIView commitAnimations ];
//
//    }

@end
