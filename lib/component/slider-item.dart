import 'package:flutter/material.dart';

class SlideMenuItem extends StatelessWidget {
  SlideMenuItem({
    Key key,
    @required this.child,
    this.alignment,
    this.padding,
    Color color,
    Decoration decoration,
    this.foregroundDecoration,
    this.height,
    BoxConstraints constraints,
    this.margin,
    this.transform,
    @required this.onTap,
  })  : assert(child != null),
        assert(margin == null || margin.isNonNegative),
        assert(padding == null || padding.isNonNegative),
        assert(decoration == null || decoration.debugAssertIsValid()),
        assert(constraints == null || constraints.debugAssertIsValid()),
        assert(
            color == null || decoration == null,
            'Cannot provide both a color and a decoration\n'
            'The color argument is just a shorthand for "decoration: new BoxDecoration(color: color)".'),
        decoration = decoration ?? (color != null ? BoxDecoration(color: color) : null),
        constraints = (height != null)
            ? constraints?.tighten(height: height) ?? BoxConstraints.tightFor(height: height)
            : constraints,
        super(key: key);

  final BoxConstraints constraints;
  final Decoration decoration;
  final AlignmentGeometry alignment;
  final EdgeInsets padding;
  final Decoration foregroundDecoration;
  final EdgeInsets margin;
  final Matrix4 transform;
  final Widget child;
  final double height;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: child,
      alignment: alignment,
      constraints: constraints,
      decoration: decoration,
      padding: padding,
      width: screenWidth / 5,
      height: height,
      foregroundDecoration: foregroundDecoration,
      margin: margin,
      transform: transform,
    );
  }
}

class SlideItem extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  final Widget child;
  final List<SlideMenuItem> menu;
  final List<Widget> children = [];
  final double height;
  final double width;
  final GestureTapCallback onTap;

  SlideItem({
    @required this.child,
    @required this.menu,
    @required this.onTap,
    @required this.width,
    this.height,
  }) {
    children
      ..add(GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (_controller.offset != 0) {
            dismiss();
          } else {
            onTap();
          }
        },
        child: Container(
          width: width,
          child: child,
        ),
      ))
      ..addAll(menu
          .map((w) => GestureDetector(
                child: w,
                onTap: () {
                  w.onTap();
                  dismiss();
                },
              ))
          .toList());
  }

  dismiss() {
    _controller.animateTo(0, duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Listener(
      onPointerUp: (d) {
        if (_controller.offset < (screenWidth / 5) * menu.length / 4) {
          _controller.animateTo(0, duration: Duration(milliseconds: 100), curve: Curves.linear);
        } else {
          _controller.animateTo(menu.length * (screenWidth / 5),
              duration: Duration(milliseconds: 100), curve: Curves.linear);
        }
      },
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _controller,
        child: Row(children: children),
      ),
    );
  }
}
