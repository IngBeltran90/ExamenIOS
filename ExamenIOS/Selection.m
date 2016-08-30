//
//  Selection.m
//  ExamenIOS
//
//  Created by Philbert on 8/28/16.
//  Copyright © 2016 Philbert. All rights reserved.
//

#import "Selection.h"

@interface Selection ()
@property NSMutableArray *SelectionArray;
@property NSMutableArray *OptionImage;
@end

@implementation Selection

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
    self.SelectionArray = [[NSMutableArray alloc] initWithObjects: @"Mapa con Clima", @"Tienda VideoJuegos online", nil];
    self.OptionImage = [[NSMutableArray alloc] initWithObjects: @"wheatericon.png", @"shoppingcarticon.jpg", nil];

}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.SelectionArray.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellSelection *cell = (cellSelection *)[tableView dequeueReusableCellWithIdentifier:@"cellSelection"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellSelection" bundle:nil] forCellReuseIdentifier:@"cellSelection"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellSelection"];
    }
    //Fill cell with info from arrays
    cell.lblOption.text     = self.SelectionArray[indexPath.row];
    cell.imgIcon.image    = [UIImage imageNamed:self.OptionImage[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //-------------------------------------------------------------------------------
    if([self.SelectionArray[indexPath.row]  isEqual: @"Mapa con Clima"]){
    [self performSegueWithIdentifier:@"WheaterMap" sender:self];
    }
    else if([self.SelectionArray[indexPath.row]  isEqual: @"Tienda VideoJuegos online"]){
        [self performSegueWithIdentifier:@"OnlineShopping" sender:self];
    }
}

/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[Selection class]]) {
        
    }
}

@end
