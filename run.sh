#!/usr/bin/env bash
rm -rf ./allure-report/
rm -rf ././results/
bundle install
cd spec
bundle exec rspec test_spec.rb
cd ..
allure generate ././results/
open http://localhost:63342/upwork-test-task/allure-report/index.html