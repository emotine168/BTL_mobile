export 'package:store_app/size_config.dart';
export 'package:store_app/routes.dart';
export 'package:store_app/theme.dart';
export 'package:store_app/constants.dart';
export 'package:store_app/services/api_services.dart';
export 'package:store_app/helpers.dart';

// controller

export 'package:store_app/controller/auth_controller.dart';
export 'package:store_app/controller/user_controller.dart';
export 'package:store_app/controller/check_out_controller.dart';
export 'package:store_app/controller/select_location_controller.dart';
export 'package:store_app/controller/search_page_controller.dart';
export 'package:store_app/controller/cart_controller.dart';
export 'package:store_app/controller/product_page_controller.dart';
export 'package:store_app/controller/special_product_controller.dart';
export 'package:store_app/controller/admin/orders_admin_controller.dart';
export 'package:store_app/controller/admin/users_admin_controller.dart';

// components
export 'package:store_app/components/button_with_shadow.dart';
export 'package:store_app/components/item_card_container.dart';
export 'package:store_app/components/default_button.dart';
export 'package:store_app/components/custom_surffix_icon.dart';
export 'package:store_app/components/errors_form.dart';
export 'package:store_app/components/section_container.dart';
export 'package:store_app/components/heading_bar_for_search_page.dart';
export 'package:store_app/components/bottom_bar.dart';
export 'package:store_app/components/product_card.dart';
export 'package:store_app/components/bigger_text_field.dart';
export 'package:store_app/components/normal_text_field.dart';

// components of screen
export 'package:store_app/screens/splash/components/splash_content.dart';
export 'package:store_app/screens/splash/components/page_dots.dart';

export 'package:store_app/screens/sign_up/components/sign_up_form.dart';

export 'package:store_app/screens/settings/components/section_container.dart';
export 'package:store_app/screens/settings/components/setting_section.dart';
export 'package:store_app/screens/settings/components/setting_section_with_switch.dart';

export 'package:store_app/screens/select_location_information/components/create_cancel_button.dart';
export 'package:store_app/screens/select_location_information/components/create_location_button.dart';

export 'package:store_app/screens/select_location/components/location_item.dart';
export 'package:store_app/screens/select_location/components/create_new_location_button.dart';

export 'package:store_app/screens/home/components/special_products.dart';

export 'package:store_app/screens/login/components/login_form.dart';

export 'package:store_app/screens/profile/components/profile_form.dart';
export 'package:store_app/screens/profile/components/profile_heading.dart';

export 'package:store_app/screens/product_list_page/components/product_type_selections.dart';
export 'package:store_app/screens/product_list_page/components/custom_type_button.dart';

export 'package:store_app/screens/product_details/components/image_slides.dart';

export 'package:store_app/screens/product_details/components/bottom_bar.dart';

export 'package:store_app/screens/otp/components/otp_form.dart';

export 'package:store_app/screens/home/components/categories.dart';
export 'package:store_app/screens/home/components/hot_deals.dart';
export 'package:store_app/screens/home/components/title_part.dart';
export 'package:store_app/screens/home/components/product_type_selection.dart';

export 'package:store_app/screens/discount/components/discount_card.dart';

export 'package:store_app/screens/choose_location_on_map/components/RoutingExample.dart';
export 'package:store_app/screens/choose_location_on_map/components/custom_dialog.dart';

export 'package:store_app/screens/check_out/components/check_out_sumary.dart';
export 'package:store_app/screens/check_out/components/discount_selection_box.dart';
export 'package:store_app/screens/check_out/components/location_selection_box.dart';
export 'package:store_app/screens/check_out/components/price_total_box.dart';
export 'package:store_app/screens/check_out/components/product_list_box.dart';
export 'package:store_app/screens/check_out/components/shipping_fee_box.dart';

export 'package:store_app/screens/cart/components/cart_item_card.dart';

export 'package:store_app/screens/cart/components/quantity_item_counter.dart';
export 'package:store_app/screens/cart/components/remove_item_button.dart';

export 'package:store_app/screens/admin/orders_manager/components/order_card.dart';

export 'package:store_app/screens/admin/products_manager/components/product_card.dart';

export 'package:store_app/screens/admin/users_manager/components/user_card.dart';
//model
export 'package:store_app/models/CartItem.dart';
export 'package:store_app/models/Discount.dart';
export 'package:store_app/models/Order.dart';
export 'package:store_app/models/Product.dart';
export 'package:store_app/models/User.dart';
export 'package:store_app/models/ProductArgument.dart';

// 3rd party
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:flutter_svg/svg.dart';
export 'dart:convert';
export 'package:store_app/controller/bindings/auth_bindings.dart';
export 'dart:async';
export 'package:here_sdk/mapview.dart';
export 'package:here_sdk/search.dart';

// routes
export 'package:store_app/screens/admin/edit_order/edit_order_screen.dart';
export 'package:store_app/screens/admin/edit_product/edit_product_screen.dart';
export 'package:store_app/screens/admin/edit_user_info/edit_user_info_screen.dart';
export 'package:store_app/screens/admin/orders_manager/orders_screen.dart';
export 'package:store_app/screens/admin/products_manager/products_screen.dart';
export 'package:store_app/screens/admin/users_manager/users_screen.dart';
export 'package:store_app/screens/advertise_page/advertise_page_screen.dart';
export 'package:store_app/screens/check_out/check_out_screen.dart';
export 'package:store_app/screens/choose_location_on_map/choose_location_on_map_screen.dart';
export 'package:store_app/screens/discount/discount_screen.dart';
export 'package:store_app/screens/order_success/order_success_screen.dart';
export 'package:store_app/screens/otp/otp_screen.dart';
export 'package:store_app/screens/cart/cart_screen.dart';
export 'package:store_app/screens/complete_profile/complete_profile_screen.dart';
export 'package:store_app/screens/forgot_password/forgot_password_screen.dart';
export 'package:store_app/screens/home/home_screen.dart';
export 'package:store_app/screens/login/login_screen.dart';
export 'package:store_app/screens/login_succes.dart/login_success_screen.dart';
export 'package:store_app/screens/message/message_screen.dart';
export 'package:store_app/screens/product_details/product_details_screen.dart';
export 'package:store_app/screens/product_list_page/product_list_page_screen.dart';
export 'package:store_app/screens/profile/profile_screen.dart';
export 'package:store_app/screens/search/search_screen.dart';
export 'package:store_app/screens/select_location/select_location_screen.dart';
export 'package:store_app/screens/select_location_information/select_location_information_screen.dart';
export 'package:store_app/screens/settings/settings_screen.dart';
export 'package:store_app/screens/sign_up/sign_up_screen.dart';
export 'package:store_app/screens/splash/splash_screen.dart';
