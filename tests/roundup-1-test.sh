#!/usr/bin/env roundup

rup() { /bin/sh $0 $1-test.sh ; }

describe "testing"

it_displays_the_title() {
	first_line=$(rup roundup-5 | head -n 1)
	test "$first_line" "=" "roundup(5)"
}

it_exists_non_zero() {
	status=$(set +e ; rup roundup-5 >/dev/null ; echo $?)
	test 2 -eq $status
}

it_survives_edge_cases() {
	rup edge
}
