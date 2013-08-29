# Spree Affiliates

[![Build Status](https://secure.travis-ci.org/jdutil/spree_affiliates.png)](http://travis-ci.org/jdutil/spree_affiliates)
[![Code Climate](https://codeclimate.com/github/jdutil/spree_affiliates.png)](https://codeclimate.com/github/jdutil/spree_affiliates)
[![Coverage Status](https://coveralls.io/repos/jdutil/spree_affiliates/badge.png?branch=master)](https://coveralls.io/r/jdutil/spree_affiliates)
[![Dependency Status](https://gemnasium.com/jdutil/spree_affiliates.png?travis)](https://gemnasium.com/jdutil/spree_affiliates)

This is an upgrade of https://github.com/printbear/spree-affiliate-sm

The extension has been renamed (underscores vs. hyphens) to comply with latest Spree conventions.

Currently, the only supported spree version is 2.0

## Summary

A simple affiliate tracking extension for Spree.  Provides the following functionality:

1. Generate a unique affiliate tracking URL for every user. 
2. Administrator's can set a cookie expiration period. 
3. Administrator's can set an affiliate commission percentage.
4. Administrator's can credit / debit a user's affiliate account balance. 
5. Registered users can view basic statistics about their affiliate performance. 

## Implementation

* Get public and migration files with:

    rake spree_affiliate_sm:install

* add the following line in AppConfiguration:

    preference :cookie_name, :string, :default => 'app_referrerid'

* add to spree_configuration.rb

    Spree::Config.set :cookie_name => "app_referrerid"

## TODO

Remove website and phone user fields?

## Credits

Copyright (c) 2011 [Sticker Mule](http://www.stickermule.com/), released under the New BSD License.
