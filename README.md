# SmartSavari - Authentication and Verification

Welcome to the SmartSavari Flutter app! This README provides an overview of how user authentication and verification were implemented in the app. You can also find the code for this project on GitHub.

## Overview

SmartSavari is a Flutter app that allows users to log in securely and access the home page. To ensure user data security and authentication, we have implemented the following features:

1. **User Registration:** New users can create an account by providing their email and password. The registration process includes input validation and secure password storage.

2. **User Login:** Registered users can log in using their email and password. The login process is protected with authentication checks.

3. **Email Verification:** To enhance security and verify user identity, an email verification step is included. Users receive a verification email with a unique link upon registration.

4. **Password Reset:** In case users forget their password, there is a password reset feature that allows them to reset their password securely.

5. **User Authentication:** Access to the home page is restricted to authenticated users only. Unauthorized users are redirected to the login screen.

## Getting Started

To explore the SmartSavari app and its authentication and verification features, follow these steps:

1. **Clone the Repository:**

   ```shell
   git clone https://github.com/your-username/smartsavari-app.git
   cd smartsavari-app

