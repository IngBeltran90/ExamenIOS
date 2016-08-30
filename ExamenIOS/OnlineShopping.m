//
//  OnlineShopping.m
//  ExamenIOS
//
//  Created by Philbert on 8/28/16.
//  Copyright © 2016 Philbert. All rights reserved.
//

#import "OnlineShopping.h"

@interface OnlineShopping ()
@property NSMutableArray *ProductName;
@property NSMutableArray *ProductImage;
@property NSMutableArray *Productprice;
@end

@implementation OnlineShopping

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-------------------------------------------------------------------------------
- (void)initController {
    self.ProductName = [[NSMutableArray alloc] initWithObjects: @"New 3DS", @"PS Vita", @"Nintendo Game Cube", @"Play Station 3", @"Wii", @"Xbox 360", @"Nintendo Wii U", @"Play Station 4", @"Xbox One", @"Steam Machine", nil];
    self.ProductImage = [[NSMutableArray alloc] initWithObjects: @"NewN3D.jpg", @"pspvita.jpg", @"NGC.png",@"PS3.png",@"wii.jpg",@"xbox360.jpg",@"NintendoWiiU.jpg",@"ps4.png",@"xboxone.jpg",@"steammachine.jpg", nil];
    self.Productprice = [[NSMutableArray alloc] initWithObjects: @"$4500", @"$2500",@"$850",@"$1500",@"$1500",@"$1500",@"$7500",@"$7000",@"$8000",@"$12000", nil];

    
}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ProductName.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellOnlineShopping *cell = (cellOnlineShopping *)[tableView dequeueReusableCellWithIdentifier:@"cellOnlineShopping"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellOnlineShopping" bundle:nil] forCellReuseIdentifier:@"cellOnlineShopping"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellOnlineShopping"];
    }
    //Fill cell with info from arrays
    cell.lblProductName.text = self.ProductName[indexPath.row];
    cell.imgProduct.image = [UIImage imageNamed:self.ProductImage[indexPath.row]];
    cell.lblProductPrice.text = self.Productprice[indexPath.row];

    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //-------------------------------------------------------------------------------
    if([self.ProductName[indexPath.row]  isEqual: @"Mapa con Clima"]){
        //[self performSegueWithIdentifier:@"WheaterMap" sender:self];
    }
    else if([self.ProductName[indexPath.row]  isEqual: @"Tienda online"]){
        //[self performSegueWithIdentifier:@"OnlineShopping" sender:self];
    }
}

/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[OnlineShopping class]]) {
        
    }
}


@end
