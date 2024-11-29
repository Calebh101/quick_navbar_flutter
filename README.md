# About

## What is this?

quick_navbar is a quick, easy-to-use package to allow you to create simple but stylish bottom navigation bars. It also includes some extra features, including an iOS-style static navigation bar, which turns off all Material Design animations, like the splash, and super-easy formats to streamline the first stages of your app.

# Usage

## Format

```dart
QuickNavBar(
    items: [
        {
            "label": String, // optional
            "icon": Icon, // required
            "selectedIcon": Icon, // optional
            "widget": Widget, // required
        },
    ],
    showLabels: bool,
    type: QuickNavBarType,
    fontSize: double,
    selectedFontSize: double,
    selectedColor: Color,
    hoverEffect: bool,
)
```

### items

- **Required**: yes
- **Type**: List
- **Description**: This is what defines your navigation items. You need a minimum of two navbar items. Here's what's included in an item:

#### label

- **Required**: sometimes
- **Type**: String
- **Description**: This is what shows under the icon in your navbar. This is **required** if `showLabels` is true, but **optional** if `showLabels` is false.

#### icon
- **Required**: yes
- **Type**: Material Icon
- **Description**: This is the actual icon that shows above the label, if it shows at all.

#### selectedIcon
- **Required**: no
- **Type**: Material Icon
- **Default**: icon parameter
- **Description**: This icon shows if the navbar item is selected. This defaults to the icon you specified in the previous parameter.

#### widget
- **Required**: yes
- **Type**: Material Widget
- **Description**: Set this to the page corresponding to the navigation item you are setting. This is set as the body when the navbar item is pressed. This does not support custom actions, but could in a future update.

### showLabels
- **Required**: no
- **Type**: boolean
- **Default**: true
- **Description**: This will show or hide the labels to your navbar. If this is true, then your labels will show up, and if you didn't put labels in the item, then they still take up space. If this is false, then your labels will not show, and they will not take up space.

### type
- **Required**: no
- **Type**: QuickNavBarType
- **Default**: QuickNavBarType.auto
- **Description**: This is what decides the type of navbar you have. It has these possible values:
    - QuickNavBarType.animate - all Material Design animations enabled
    - QuickNavBarType.static - all Material Design animations disabled, making it like an iOS tab style
    - QuickNavBarType.auto: will use static if the platform is on an Apple device, otherwise will use animate

### fontSize
- **Required**: no
- **Type**: double
- **Default**: 12
- **Description**: This decides the default font size of the navbar items' text.

### selectedFontSize
- **Required**: no
- **Type**: double
- **Default**: If type is static, then it is the same as the fontSize parameter, otherwise it is 1.25x the fontSize parameter
- **Description**: This is the font size of the text of the navbar item that is currently selected.

### color
- **Required**: no
- **Type**: Material Color
- **Default**: default (decided by Flutter)
- **Description**: This decides the default theme color of the navbar items' text.

### selectedColor
- **Required**: no
- **Type**: Material Color
- **Default**: default (decided by Flutter)
- **Description**: This is the theme color of the navbar item that is currently selected.

### hoverEffect
- **Required**: no
- **Type**: boolean
- **Default**: false
- **Description**: Decides if there should be a small bubble around the icons. This is a default in the BottomNavBar Flutter widget, but I have overwritten this to default to not show. However, it will show if this is true.