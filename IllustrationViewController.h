//
//  IllustrationViewController.h
//  試し
//
//  Created by 加藤 周 on 2014/08/11.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//
int hyojo;
#import "ViewController.h"

@interface IllustrationViewController : ViewController{
        IBOutlet UIImageView* illustration1;
        IBOutlet UIImageView* illustration2;
    IBOutlet UIImageView* illustration3;
    IBOutlet UIImageView* illustration4;
    IBOutlet UIImageView* illustration5;
    IBOutlet UIImageView* illustration6;
    int kaisu1;

    IBOutlet UIButton*button;
    IBOutlet UIImageView*next;

    IBOutlet UIButton*button1;
    IBOutlet UIImageView*back;
    
    IBOutlet UIButton* illustrationButton1;
    IBOutlet UIButton* illustrationButton2;
    IBOutlet UIButton* illustrationButton3;
    IBOutlet UIButton* illustrationButton4;
    IBOutlet UIButton* illustrationButton5;
    IBOutlet UIButton* illustrationButton6;


}
-(IBAction)illustrationButton1;
-(IBAction)illustrationButton2;
-(IBAction)illustrationButton3;
-(IBAction)illustrationButton4;
-(IBAction)illustrationButton5;
-(IBAction)illustrationButton6;
@end
