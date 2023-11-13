# flutter_payment

Integrate Payment in Flutter with Stripe

## Demo

https://github.com/ima0112/flutter_payment/assets/66929873/598ab25a-ca2a-4c9f-bf9d-6bedad369229

## Note
It is recommended that you do not handle STEP 1 from the client side of your application for security reasons. Instead, you should set up your backend server to create the payment intent and return the client_secret used in STEP 2 to initialise your payment sheet. You can follow this link https://stripe.com/docs/payments/accept-a-payment?platform=react-native&ui=payment-sheet#react-native-add-server-endpoint on how to do that.
