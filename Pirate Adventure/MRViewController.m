//
//  MRViewController.m
//  Pirate Adventure
//
//  Created by Mark Rabins on 5/13/14.
//  Copyright (c) 2014 Mark Rabins. All rights reserved.
//

#import "MRViewController.h"
#import "MRFactory.h"
#import "MRTitle.h"

@interface MRViewController ()

@end

@implementation MRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    MRFactory *factory = [[MRFactory alloc] init];
   self.titles = [factory title];
   self.character = [factory character];
   self.boss = [factory boss];
   self.currentPoint = CGPointMake(0,0);
    [self updateCharacterStatsForArmor:nil withWeapon:nil withHealthEffect:0];
    [self updateTitles];
    [self updateButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender
{

    MRTitle *tile = [[self.titles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    if (tile.healthEffect == -15){
        self.boss.health = self.boss.health - self.character.damage;
    }
    
    [self updateCharacterStatsForArmor:tile.armour withWeapon:tile.weapon withHealthEffect:tile.healthEffect];
    if(self.character.health <=0)
    {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You have died please restart the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }
    
    else if (self.boss.health <= 0) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory"message:@"You killed the evil pirate boss!" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }
    
    [self updateTitles];
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateButtons];
    [self updateTitles];
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTitles];
}
- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTitles];
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    self.character = nil;
    self.boss = nil;
   [self viewDidLoad];
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTitles];
}

# pragma mark - Helper Method

-(void)updateTitles
{
    MRTitle *titleModel = [[self.titles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = titleModel.story;
    self.backgroundImageView.image = titleModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text =  self.character.armour.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionButton setTitle:titleModel.actionButtonName forState:UIControlStateNormal];
}

-(void) updateButtons
{
    self.westButton.hidden = [self titleExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self titleExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.northButton.hidden = [self titleExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self titleExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
}

-(BOOL)titleExistsAtPoint:(CGPoint)point
{
 
    if (point.y >= 0 && point.x >=0 && point.x <[self.titles count] && point.y < [[self.titles objectAtIndex:point.x] count]){
        return NO;
    }
    else {
        return YES;
    }
}

-(void)updateCharacterStatsForArmor:(MRArmour *)armor withWeapon:(MRWeapon *)weapon withHealthEffect:(int) healthEffect;
{
    if (armor !=nil){
        self.character.health = self.character.health - self.character.armour.health + armor.health;
        self.character.armour = armor;
    }
    else if (weapon !=nil){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0 ){
        self.character.health = self.character.health + healthEffect;
    }
    else{
        self.character.health = self.character.health + self.character.health;
        self.character.damage = self.character.damage + self.character.damage;
    }
}


@end
