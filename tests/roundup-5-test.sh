#!/usr/bin/env roundup

describe "roundup(5)"

before() {
	foo="bar"
}

after() {
	rm -f foo.txt
}

it_passes() {
	true
}

it_fails() {
	false
}

it_runs_before() {
	test "$foo" "=" "bar"
}

it_runs_after_a_test_passes_part_1() {
	touch foo.txt
	test -f foo.txt
}

it_runs_after_a_test_passes_part_2() {
	test "!" -f foo.txt
}

it_runs_after_if_a_test_fails_part_1() {
	touch foo.txt
	test -f foo.txt
	false
}

it_runs_after_if_a_test_fails_part_2() {
	test "!" -f foo.txt
}

