#!/usr/bin/env bash

dir=$(pwd)
cd "$1"

cat country_dist.html hours_dist.html username_dist.html > htmlfiles.html

../bin/wrap_contents.sh htmlfiles.html ../html_components/summary_plots failed_login_summary.html
