//
//  HelloWorldViewController.m
//  HelloWorld
//
//  Created by Pascal Linder on 10/07/11.
//  Copyright 2011 -. All rights reserved.
//

#import "HelloWorldViewController.h"

@implementation HelloWorldViewController

-(IBAction) btnClicked:(id) sender {
    //--display an alert view--	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello World!" 
													message:@"iPad, here I come!" 
												   delegate:self
										  cancelButtonTitle:@"OK" 
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
