//
//  ViewController.m
//  iPullTableToZoom
//
//  Created by Rajesh on 5/27/15.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *imageView;
    CGRect rectDefault;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    rectDefault = CGRectMake(0, 0, self.view.frame.size.width, 44);
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];

    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"House.png"]];
    [imageView setFrame:rectDefault];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.tableView addSubview:imageView];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:rectDefault];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = -scrollView.contentOffset.y;
    if (y > 0)
    {
        imageView.frame = CGRectMake(0, scrollView.contentOffset.y, rectDefault.size.width+y, rectDefault.size.height+y);
        imageView.center = CGPointMake(self.view.center.x, imageView.center.y);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell.textLabel setText:[NSString stringWithFormat:@"Row - %ld",(long)indexPath.row]];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
