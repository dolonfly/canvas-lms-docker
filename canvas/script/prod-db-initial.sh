#!/bin/bash
# 在canvas lms 目录执行该脚本
RAILS_ENV=production bundle exec rake db:initial_setup;