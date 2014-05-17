//
//  MRFactory.m
//  Pirate Adventure
//
//  Created by Mark Rabins on 5/13/14.
//  Copyright (c) 2014 Mark Rabins. All rights reserved.
//

#import "MRFactory.h"
#import "MRTitle.h"

@implementation MRFactory

-(NSArray *) title
{
    MRTitle *title1 = [[MRTitle alloc] init];
    title1.story = @"Captain, where is the fearless leader you claimed to be?  Would you like the blunted sword to begin showing direction?";
    title1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    MRWeapon *bluntedSword = [[MRWeapon alloc] init];
    bluntedSword.name = @"Blunted Sword";
    bluntedSword.damage = 12;
    title1.weapon = bluntedSword;
    title1.actionButtonName = @"Take the sword";
    
    MRTitle *title2 = [[MRTitle alloc] init];
    title2.story = @"You have come across an opportunity to obtain armor, would you like to?";
    title2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    MRArmour *steelArmour = [[MRArmour alloc] init];
    steelArmour.name = @"Steel Armor";
    steelArmour.health = 8;
    title2.armour = steelArmour;
    title2.actionButtonName = @"Take Armor";
    
    MRTitle *title3 = [[MRTitle alloc] init];
    title3.story = @"Do you see the dock, on the horizon? Stop now to ask for directions!";
    title3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    title3.healthEffect = 12;
    title3.actionButtonName = @"Stop at the dock";
    
    NSMutableArray *firstColumn = [[ NSMutableArray alloc] init];
    [firstColumn addObject:title1];
    [firstColumn addObject:title2];
    [firstColumn addObject:title3];
    
    MRTitle *title4 = [[MRTitle alloc] init];
    title4.story = @"Good job, you can found the parrot. Parrots are goodluck, and help see things you might not see. ";
    title4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    MRArmour *parrotArmour = [[MRArmour alloc] init];
    parrotArmour.health = 20;
    parrotArmour.name = @"Parrot";
    title4.actionButtonName = @"Adopt Parrot";
    
    MRTitle *title5 = [[MRTitle alloc] init];
    title5.story = @"You have stumbled upon secret pirate weapons. Would you like to upgrade? ";
    title5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    MRWeapon *pistolWeapon = [[MRWeapon alloc] init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damage = 17;
    title5.actionButtonName = @"Upgrade";

    MRTitle *title6 = [[MRTitle alloc] init];
    title6.story = @"You have been captured by pirates, and are ordered to walk the plank.";
    title6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    title6.healthEffect = -22;
    title6.actionButtonName = @"Show no fear";
    
    NSMutableArray *secondColumn = [[ NSMutableArray alloc] init];
    [secondColumn addObject:title4];
    [secondColumn addObject:title5];
    [secondColumn addObject:title6];
    
    MRTitle *title7 = [[MRTitle alloc] init];
    title7.story = @"Your parrot noticed a battle in the distance. He thinks you should go help.";
    title7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    title7.healthEffect = 8;
    title7.actionButtonName = @"Go help";
    
    MRTitle *title8 = [[MRTitle alloc] init];
    title8.story = @"The legend of the deep. The might kraken appears.";
    title8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    title8.healthEffect = - 46;
    title8.actionButtonName = @"Abandon ship";
    
    MRTitle *title9 = [[MRTitle alloc] init];
    title9.story = @"You have found the hidden cave, take the pirate treasurer!";
    title9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    title9.healthEffect = 20;
    title9.actionButtonName = @"Take teasure";
    
    NSMutableArray *thirdColumn = [[ NSMutableArray alloc] init];
    [thirdColumn addObject:title7];
    [thirdColumn addObject:title8];
    [thirdColumn addObject:title9];
    
    MRTitle *title10 = [[MRTitle alloc] init];
    title10.story = @"A group of pirate attempts to board your ship.";
    title10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    title10.healthEffect = - 15;
    title10.actionButtonName = @"Repel the invaders";
    
    MRTitle *title11 = [[MRTitle alloc] init];
    title11.story = @"In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    title11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    title11.healthEffect = - 7;
    title11.actionButtonName = @"Swim deeper";

    
    MRTitle *title12 = [[MRTitle alloc] init];
    title12.story = @"Your final faceoff with the fearsome pirate boss!";
    title12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    title12.healthEffect = - 15;
    title12.actionButtonName = @"Fight";
    
    NSMutableArray *fourthColumn = [[ NSMutableArray alloc] init];
    [fourthColumn addObject:title10];
    [fourthColumn addObject:title11];
    [fourthColumn addObject:title12];
    
    NSArray *titles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return titles;
}

-(MRCharacter *) character{
    MRCharacter *character = [[MRCharacter alloc] init];
    character.health = 100;
    MRArmour *armour = [[MRArmour alloc] init];
    armour.name = @"Protection";
    armour.health = 5;
    character.armour = armour;
    MRWeapon *weapon = [[MRWeapon alloc] init];
    weapon.name = @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;
    
    return character;
   
    }

-(MRBoss *)boss{
    MRBoss *boss = [[MRBoss alloc] init];
    boss.health = 65;
    return boss;

    
 }
@end
