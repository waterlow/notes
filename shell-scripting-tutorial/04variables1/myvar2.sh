#!/bin/bash

cd `dirname $0`
SCRIPT_DIR=`pwd`
: > $SCRIPT_DIR/tmp.csv

GEMS=(rails
composite_primary_keys
aasm
active_model_serializers
activemodel-serializers-xml
activerecord-cursor
activerecord-import
activerecord6-redshift-adapter
addressable
apollo_upload_server
asset_sync
awesome_print
aws-sdk-cloudsearch
bcrypt
bootstrap-sass
browser
capistrano
carmen
coffee-rails
coffee-script-source
committee
connection_pool
counter_culture
daemons
dalli
delayed_job_active_record
discard
dkim
doorkeeper
draper
dynamoid
ejs
exception_notification
faker
faker-japanese
faraday
faraday-cookie_jar
faraday_middleware
fastimage
fog-aws
font-awesome-sass
gon
google-apis-androidpublisher_v3
graphql
graphql-batch
hana
hashie
her
holiday_jp
httparty
httpclient
hubspot-api-client
i18n-js
iconv
jb
jbuilder
jmespath
jwt
kaminari
kintone
legato
mail
mechanize
memoist
mini_racer
msgpack
mustache
mysql2
net-ssh
newrelic_rpm
nokogiri
non-stupid-digest-assets
oauth
oauth2
oj
omniauth-rails_csrf_protection
omniauth-slack
paper_trail
parallel
phonelib
public_suffix
rainbow
regexp_trie
representable
request_store
rest-client
retriable
rinku
rmagick
rotp
rqrcode
sassc-rails
secure_headers
seed-fu
sendgrid-ruby
settingslogic
shoryuken
signet
slack-notifier
slack-ruby-client
slim-rails
sprockets
stripe
switch_point
tzinfo-data
uglifier
urbanairship
vcard
whenever
xml-simple
zstd-ruby
puma
better_errors
binding_of_caller
erb_lint
guard-rspec
letter_opener_web
listen
parallel_tests
rack-cors
sinatra
spring
spring-commands-rspec
spring-commands-rubocop
spring-commands-teaspoon
spring-watcher-listen
web-console
capybara-screenshot
database_cleaner-active_record
fake_ftp
rails-controller-testing
rspec_junit_formatter
ruby-prof
shoulda-matchers
simplecov
stripe-ruby-mock
stackprof
test-prof
timecop
webmock
bootsnap
byebug
capybara
dotenv-rails
factory_bot_rails
fuubar
i18n-tasks
pry-byebug
pry-rails
rspec
rspec-collection_matchers
rspec-its
rspec-parameterized
rspec-rails
rubocop
rubocop-rails
rubocop-rspec
selenium-webdriver
teaspoon
teaspoon-mocha
coverband)

SUM1=0
SUM2=0


for gem in "${GEMS[@]}"
do
  cd $(ghq list -p -e $gem)
  COUNT1=$(grep -r --include='*.rb'  "{|" . | wc -l | tr -d ' ')
  COUNT2=$(grep -r --include='*.rb'  "{ |" . | wc -l | tr -d ' ')

  if test $COUNT1 -eq $COUNT2 ; then
    WINNER=0
  elif test $COUNT1 -gt $COUNT2 ; then
    WINNER=1
  else
    WINNER=-1
  fi

  SUM1=$(($SUM1 + $COUNT1))
  SUM2=$(($SUM2 + $COUNT2))

  echo "$gem,$COUNT1,$COUNT2,$WINNER" >> $SCRIPT_DIR/tmp.csv
done

echo "sum,$SUM1,$SUM2" >> $SCRIPT_DIR/tmp.csv
