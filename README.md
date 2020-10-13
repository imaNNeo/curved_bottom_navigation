# Curved Bottom Navigation.

[![pub package](https://img.shields.io/pub/v/curved_bottom_navigation.svg)](https://pub.dartlang.org/packages/curved_bottom_navigation)

<img src="https://github.com/imaNNeoFighT/curved_bottom_navigation/raw/master/repo_files/curved_bottom_navigation.gif" width="300">

This is implementation of an artwork in [Uplabs](https://www.uplabs.com/posts/gaming-app-design-fdb8a2ac-0f96-418a-826e-361d55e11f4f)


# Let's get started

## 1 - Depend on it

### Add this to your package's pubspec.yaml file:

```kotlin
dependencies:
  curved_bottom_navigation: ^1.0.0
```

## 2 - Install it

### install packages from the command line:
```kotlin
flutter packages get
```

## 3 - Import it
### Now in your Dart code, you can use:
```kotlin
import 'package:curved_bottom_navigation/curved_bottom_navigation.dart';
```

## 5 - Use it like a charm
### Make your TabItems
```kotlin
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: navPos,
            children: [
              Page1(),
              Page2(),
              Page3(),
              Page4(),
              Page5(),
            ],
          )
          Align(
            alignment: Alignment.bottomCenter,
            child: CurvedBottomNavigation(
              selected: navPos,
              onItemClick: (i) {
                setState(() {
                  navPos = i;
                });
              },
              items: [
                Icon(Icons.search, color: Colors.white),
                Icon(Icons.star, color: Colors.white),
                Icon(Icons.home, color: Colors.white),
                Icon(Icons.notifications, color: Colors.white),
                Icon(Icons.settings, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
```


#### :moneybag: Donation (bitcoin) :moneybag:
##### Buy me some food to survive, I would add more features if I was alive
<img src="https://github.com/imaNNeoFighT/fl_chart/raw/master/repo_files/images/bitcoin_public_key.jpg" width="180" >

`1L7ghKdcmgydmUJAnmYmMaiVjT1LoP4a45`