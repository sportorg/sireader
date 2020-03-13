PYTHONPATH = PYTHONPATH=./
TEST = $(PYTHONPATH) pytest --verbosity=2 --showlocals --log-level=DEBUG --strict $(arg) -k "$(k)"
PYLINT_CODE = .
CODE = $(PYLINT_CODE)

.PHONY: test test-fast test-failed test-cov teamcity lint format check

test:
	$(TEST) --cov

test-fast:
	$(TEST) --exitfirst

test-failed:
	$(TEST) --last-failed

test-cov:
	$(TEST) --cov --cov-report html

teamcity: export TEAMCITY_VERSION=1
teamcity: lint test

lint:
	flake8 --jobs 4 --statistics --show-source $(CODE)
	#pylint --jobs 4 --rcfile=setup.cfg $(PYLINT_CODE)
	black --target-version py37 --skip-string-normalization --check $(CODE)
	pytest --dead-fixtures --dup-fixtures
	safety check --bare --full-report

format:
	autoflake --recursive --in-place --remove-all-unused-imports $(CODE)
	isort --apply --recursive $(CODE)
	black --target-version py37 --skip-string-normalization $(CODE)
	unify --in-place --recursive $(CODE)

check: format lint test