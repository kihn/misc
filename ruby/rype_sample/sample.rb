# -*- coding: utf-8 -*-
require 'bundler/setup'
require 'rype'
require 'github_api'

Rype.attach
chat_id = ARGV.shift


github = Github.new basic_auth: 'USERID:PASS'
pr_list =github.pull_requests.list 'USERID', 'REPOSITORY'
pr = pr_list.shift
Rype.chat(chat_id).send_message("[pull request]" + pr.user.login + "\n" + pr.url + "\n" + pr.body)
