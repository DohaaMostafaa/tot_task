## Overview  
This is a small Flutter e-commerce app with a cart system. It focuses on clean architecture, SOLID principles, and good OOP practices.  

## Features  
- Add or remove products from the cart  
- Show total price of cart items  
- Apply promo code discounts  
- Home and Cart pages 
- Local banners and product categories  
- Responsive layout with shimmer loading placeholders  
- Light and dark mode support  
- Unit tests for the cart repository  

## API Endpoints Used  
- **Products**: https://fakestoreapi.com/products  
- **Categories**: https://fakestoreapi.com/products/categories  

## Project Structure  
- **lib/core/** → Common logic (DI, helpers, networking, router, theme, widgets)  
- **lib/features/** → Feature modules (cart, home)  
- **assets/** → Images files  
- **test/** → Unit tests (cart)  

## State Management  
The app uses **Cubit** from the `flutter_bloc` package for handling state.  

## Theming  
Light and dark themes are implemented with Flutter’s theming system.  

## Design Choices  
- Applied SOLID principles and OOP best practices for cleaner, maintainable code  
- Dependency injection is used for repositories and services  
- Features and shared logic are clearly separated for scalability  
