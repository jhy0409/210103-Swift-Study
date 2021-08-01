//
//  ViewController.h
//  dasiBom_for_dementiaPrevention
//
//  Created by inooph on 2021/07/30.
//

#import <UIKit/UIKit.h>
@import GoogleSignIn;
@import Firebase;

@interface ViewController : UIViewController<GIDSignInDelegate, GIDSignUIDelegate>
@property (weak, nonatomic) IBOutlet GIDSignInButton *signInButton;
@property (weak, nonatomic) IBOutlet UIButton *signOutButton;


@end

