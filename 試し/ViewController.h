//
//  ViewController.h
//  試し
//
//  Created by 加藤 周 on 2014/05/27.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
@interface ViewController : UIViewController{
    UIImageView *canvas;
    //お絵描きしていくキャンバス(画用紙)を準備します
    CGPoint touchPoint;
    //お絵描きに使う座標を準備します
    int rgb;//色を使い分けるために必要
    IBOutlet UISwitch *keshigom;//UISwitchの宣言
    IBOutlet UISegmentedControl *seg;//UISegmentの宣言
    UIImage *capture;
}
-(IBAction)save;
-(void)png;
@end
