# Current Status: Release

### 0.0.0 - 11/28/24

- Initial beta release

### 0.0.1 - 11/28/24

- Added web support
- Improved functionality

### 0.0.2 - 11/28/24

- Improved functionality

### 0.0.3 - 11/28/24

- Improved functionality
- Added example
- Improved documentation

### 0.0.4 - 11/28/24

- Improved functionality
- Improved documentation

### 0.0.5 - 11/28/24

- Improved documentation

### 0.0.6 - 11/28/24

- Improved documentation

### 1.0.0 - 11/28/24

- Initial public release

### 1.0.1 - 11/28/24

- Improved documentation

### 1.0.2 - 11/28/24

- Improved documentation

### 1.0.3 - 11/28/24

- Improved documentation

### 1.0.4 - 11/29/24

- Changed default selected color to the application accent color
- Fixed theme overwrite bug

### 1.1.0 - 12/1/24

- New beta feature: sidebar
  - The sidebar feature is a new beta feature allowing the bottom navbar to become a side navbar for larger screens. This is false by default, until it becomes a released feature.

### 1.1.1 - 12/1/24

- Now new parameter: sidebarBeta: set to true to use the sidebar (which can be true, false, or auto); default is false
- Known issue: sidebar mode does not respect chosen QuickNavBarType and hoverEffect
- Improved documentation

### 1.1.2 - 12/1/24

- sidebar icons are now showing the correct color, and bottom navbar icons have been updated to future-proof the issue
- Example now has dark mode
- Known issue: sidebar mode does not respect chosen QuickNavBarType and hoverEffect

### 1.1.3 - 12/14/24

- New feature for items: onPressed
- Some other bug fixes and minor changes

### 1.2.0 - 1/30/25

Been a while since I published an update, huh? Thought I forgot about this package?
WARNING: This update does introduce breaking changes. Please understand these changes before the update.

- BREAKING: Instead of using JSON for the Navbar items, it uses QuickNavBarType. It has the same parameters as the previous JSON implementation.
- Deprecated sidebarBeta, as it is now ready for final release