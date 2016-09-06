###起因
我在一个用xib创建的cell时，在xib文件里布局的控件没有问题，但是在setmodel方法中用代码布局的控件总是会出现位置不准确的问题。在简单测试了几个方法后，发现在代码布局前执行一次[self layoutIfNeeded]就不会出现位置不准确的问题了。
代码：

```
- (void)setModel:(NSString *)model {
    if (self.bottomView) {
        [self.bottomView removeFromSuperview];
        self.bottomView = nil;
    }
    CGFloat x = self.topView.frame.origin.x;
    CGFloat y = self.topView.frame.origin.y;
    CGFloat height = self.topView.frame.size.height;
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(x, y + height, 20, 20)];
    self.bottomView.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:self.bottomView];   
}
```
从代码上看cell中bottomView应该是紧挨在topView下面的
（图片）
但是结果总是这样的
（图片）	
但是在最前面加上[self layoutIfNeeded];这行代码就可以正常显示了
###股沟粑粑ing
因为没有接触这个方法，所以我简单粗暴直接股沟layoutIfNeeded这个方法的作用。 
[原文链接](http://blog.sina.com.cn/s/blog_5fde60890102vhzq.html)  
layoutIfNeeds：  
1、最重要的作用是通过新的父视图的frame，将子视图的约束转换为子视图的frame  
2、立即调用layoutSubviews方法
###结果
从layoutIfNeeded的第一个作用可以看出来，布局不准确的原因就是在布局的时候还是老的父视图的frame下，子视图的的约束转化为子视图的frame。老的父视图的frame是xib默认的尺寸，所以这才是布局不准确的问题。
___  
**注意[self layoutIfNeeded]代码执行的时间点：**最开始我就只把这个方法放在setModel的方法中，但是还是有一些cell的布局有问题。后来我才注意到，我把一个UILabel的lines设置成两行，有时候文字多的时候，label就会变成两行，这时候cell下面的布局约束其实又发生了变化，但是我执行layoutIfNeeded的时间点时label只有一行。所以需要注意这句代码执行的时间点。
###学习：股沟时看到的其他知识
####layoutSubviews
layoutSubviews方法的作用：对自己subviews重写进行布局  
layoutSubviews执行的时间点：  
>1.当view的frame发生改变的时候，所以initwithframe也会触发
>2.有子视图加入时，addSubView  
>3.直接调用LayoutSubViews  
>4.滑动UIScrollView的时候  
>5.旋转屏幕的时候，因为旋转屏幕会触发父视图执行layoutSubviews，自身视图的frame也会发生改变，所以也会执行layoutSubviews  
>6.和5相对的，改变一个UIView的frame也会触发父类的layoutSubviews方法。		

___
**自己的结论**:这里出来自身view执行layoutSubviews这个方法外，其实都是自己frame或着SubViews的frame发生变化时才会触发这个方法。(旋转屏幕其实也是改变frame吧？，加入SubView时，其实也是子视图的frame从无到有的过程吧？我自己就是这么记忆的)
####setNeedsLayout和layoutIfNeeded
**setNeedsLayout** 标记一个重新布局flag，但是不是立即执行刷新，但是layoutSubviews一定是会被调用的。  
**layoutIfNeeded** 解开约束和位置坐标的耦合。如果该view有刷新标记立即执行layoutSubViews进行布局（我在实际测试时cell，直接执行该方法不执行上述方法也会立即执行layoutSubViews,但是在view中测试则必须要先执行setNeedsLayout这个方法，所以以防万一还会把两个方法都执行比较安全）  
####setNeedsDisplay和setNeedsLayout
两个方法都是异步执行，*setNeedsLayout*会调用layoutSubviews,*setNeedsDisplay*会调用drawRect方法，只有在drawRect方法中才可以拿到图形上下文，才能画画，而layoutSubviews多用于处理图形的位置关系。
