# Makefile

# Define the virtual environment directory
VENV_DIR = .venv

# Define the Python executable
PYTHON = $(VENV_DIR)/bin/python

# Define the name of the executable
EXECUTABLE = crypto-tracker

# Default target
all: venv install

# Create a virtual environment
venv:
	python3 -m venv $(VENV_DIR)

# Install dependencies
install: requirements.txt
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install -r requirements.txt

# Make the script executable and create a symlink or copy to /usr/local/bin
install-executable: src/main.py
	chmod +x src/main.py
	ln -sf $(realpath src/main.py) /usr/local/bin/$(EXECUTABLE)

# Run the main script
run: install
	$(PYTHON) src/main.py

# Clean up the virtual environment and the executable
clean:
	rm -rf $(VENV_DIR)
	rm -f /usr/local/bin/$(EXECUTABLE)

# Rebuild everything
rebuild: clean all install-executable
