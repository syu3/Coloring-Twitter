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



    IBOutlet UIImageView *canvas;
    CGPoint touchPoint;
    UIImage*capure;

    int rgb;
        int c;
        UIImageView*tweetImageView;
    IBOutlet UIImageView*imageview;


}
-(IBAction)red;
-(IBAction)green;
-(IBAction)blue;
-(IBAction)yellow;
-(IBAction)black;
-(IBAction)white;
-(IBAction)shou;
-(IBAction)dai;
-(IBAction)tweet;
@end
