<!-- TITLE -->
<div align="center">
<h1>
Jungle
</h1>
<img src="docs/rubyrails.png" width=200 alt="rubyrails.png" />
<p>A mini Rails e-commerce application
</p>

<p>Built with <a href="http://guides.rubyonrails.org/v4.2/">Rails 4.2</a>, <a href="https://stripe.com/docs/api">Stripe</a>, <a href="https://www.postgresql.org/">PostgreSQL</a>, <a href="https://bootstrapdocs.com/v3.3.6/docs/getting-started/">Bootstrap</a> and CSS/<a href="https://sass-lang.com/">Sass</a>
</div>

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Screenshots
⭐ Listings display on main page
![](https://github.com/MrinalN/Jungle/blob/master/docs/jungle-main-page.gif)


⭐ Add new product via Admin Dashboard
![](https://github.com/MrinalN/Jungle/blob/master/docs/jungle-add-product.gif)


⭐ Load cart and process payments using Stripe
![](https://github.com/MrinalN/Jungle/blob/master/docs/jungle-cart-pay.gif)
