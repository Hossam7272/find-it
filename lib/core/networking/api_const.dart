class ApiConst{
  static const String serverName          = 'http://192.168.43.168/lost';
  static const String login               = '$serverName/auth/login.php';
  static const String signup              = '$serverName/auth/signup.php';
  static const String user                = '$serverName/auth/user.php';
  static const String viewChildren        = '$serverName/children/view.php';
  static const String viewChildrenById    = '$serverName/children/view_by_id.php';
  static const String addItem             = '$serverName/items/add.php';
  static const String addChildren         = '$serverName/children/add.php';
  static const String editProfile         = '$serverName/edit_profile/edit_profile.php';
  static const String changePassword      = '$serverName/edit_profile/change_password.php';
  static const String viewItemsById       = '$serverName/items/view_by_id.php';
  static const String imageFolder         = '$serverName/uploaded';
  static const String deleteItem          = '$serverName/items/delete.php';
  static const String deleteChild         = '$serverName/children/delete.php';
  static const String childLocation         = '$serverName/children/get_child_location.php';
}