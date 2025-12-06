.PHONY: help install dev clean build upload test run

help:
	@echo "Color Notify - Makefile Commands"
	@echo "================================="
	@echo "install    - Install package"
	@echo "dev        - Install in development mode"
	@echo "clean      - Clean build artifacts"
	@echo "build      - Build distribution packages"
	@echo "upload     - Upload to PyPI"
	@echo "test-upload - Upload to Test PyPI"
	@echo "test       - Run tests"
	@echo "run        - Run the application"
	@echo "lint       - Run linters"

install:
	pip install -e .

dev:
	pip install -e ".[dev]"

clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete

build: clean
	python -m build

upload: build
	python -m twine upload dist/*

test-upload: build
	python -m twine upload --repository testpypi dist/*

test:
	python -m pytest tests/ -v

run:
	python -m color_notify

lint:
	python -m flake8 color_notify.py
	python -m pylint color_notify.py

format:
	python -m black color_notify.py

check:
	python -m twine check dist/*