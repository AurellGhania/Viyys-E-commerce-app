import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-manegement/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  
  const BottomNavbar({super.key, required this.selectedIndex, required this.onItemTapped});
  
  //int _selectedIndex = 0;
  // @override
  // Widget build(BuildContext context) {
  //   return BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,
  //     backgroundColor: Colors.white
  //     ,
  //     selectedItemColor: primaryColor
  //     ,
  //     unselectedItemColor: Colors.grey
  //     ,
  //     showUnselectedLabels: false
  //     ,
  //     showSelectedLabels: false
  //     ,
  //     currentIndex: selectedIndex
  //     ,
  //     onTap: onItemTapped
  //     ,
  //     items: const [
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.home
  //         ),
  //         label: "Home"
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.shopping_cart
  //           ),
  //           label: "Cart"
  //           ),
  //           BottomNavigationBarItem(
  //             icon: Icon(Icons.settings
  //             ),
  //             label: "Settings"
  //             ),
  //             BottomNavigationBarItem(
  //               icon: Icon(Icons.person
  //               ),
  //               label: "Profile"
                
  //               ),
  //               BottomNavigationBarItem(
  //                 icon: Icon(Icons.logout
  //                 ),
  //                 label: "Logout"
                  
  //                 ),
  //                 ],
  //                 );
  //                 }

  @override
  Widget build(BuildContext context) {
      final themeProvider = Provider.of<ThemeProvider>(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // backgroundColor: Colors.white,
      // selectedItemColor: primaryColor,
      // unselectedItemColor: Colors.grey,
      // showUnselectedLabels: false,
      // showSelectedLabels: false,
      // currentIndex: selectedIndex,
      // onTap: onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Wishlist'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payment),
          label: 'Setting'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Profile'
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: themeProvider.isDarkTheme ? Colors.white : primaryColor,
      unselectedItemColor: themeProvider.isDarkTheme ? Colors.grey.shade600 : Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      
      onTap: onItemTapped,
    );
  }
}