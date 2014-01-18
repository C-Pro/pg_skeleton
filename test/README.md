pgTAP example test suite
========================

Test functions should be placed in corresponding functions_<schema>.sql files.
One-liner tests and test function calls should be in tests/<schema>_<test-category>.sql
You should always update number of tests in plan(n) call in run_<schema>.sql file when
you add new test to schema test suite.