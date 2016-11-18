//
//  FarmViewController.m
//  Farm
//
//  Created by Lázaro Sánchez Campos on 08/11/13.
//  Copyright (c) 2013 UPM. All rights reserved.
//

#import "FarmViewController.h"
#import "GHPView.h"

@interface FarmViewController ()

@end


@implementation FarmViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
	// Crear reconocedor de Tap para crear gallina
	UITapGestureRecognizer *tapRec = [[UITapGestureRecognizer alloc]
									  initWithTarget:self
									  action:@selector(processRootTap:)];
	[tapRec setNumberOfTapsRequired:1]; // innecesario, es el defecto
	[self.view addGestureRecognizer:tapRec];
	
	// Crear reconocedor de Swipe para borrar todo
	UISwipeGestureRecognizer * swipeRec = [[UISwipeGestureRecognizer alloc]
										   initWithTarget:self
										   action:@selector(processRootSwipe:)];
	swipeRec.direction = UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft;
	[self.view addGestureRecognizer:swipeRec];
    
}


- (void)processRootTap:(UITapGestureRecognizer *)sender {
	
	CGPoint pos = [sender locationInView:sender.view];
    
	CGRect rect = CGRectMake(pos.x, pos.y, 1, 1);
	GHPView *imgv = [[GHPView alloc] initWithFrame:rect];
	
	[self.view addSubview:imgv];
}


- (void) processRootSwipe:(UISwipeGestureRecognizer *)sender {
	
	[UIView transitionWithView:self.view
					  duration:0.5
					   options: UIViewAnimationOptionTransitionFlipFromLeft
					animations:^{
						for (UIView *subview in [self.view subviews]) {
							[subview removeFromSuperview];
						}
					}
					completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
