#!/usr/bin/env bash

cd "$1" || exit

cat country_dist.html hours_dist.html username_dist.html > htmlfiles.html

../bin/wrap_contents.sh htmlfiles.html ../html_components/summary_plots failed_login_summary.html
