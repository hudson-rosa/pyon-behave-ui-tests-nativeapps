import os

SEP = os.sep


def main():
    run_updates()


def run_updates():
    print("\nUpdating PIP...")
    os.system(f"python3 -m pip install --upgrade pip")

    print("\nInstalling Python Environment...")
    os.system(f"python3 -m pip install pipenv")

    print("\nSetting a new Python Environment...")
    os.system(f"python3 -m venv venv")
    os.system(f"source venv/bin/activate")

    print("\nUpdating all packages and resources...")
    os.system(f"python3 -m pip install -r requirements.txt")
    os.system(f"python3 -m pip install -U black")
    os.system(f"python3 -m pip install -U rope")

    print("\nPackages installed:")
    os.system(f"python3 -m pip list")
    os.system(f"python3 -m pip install --upgrade pip")

class Update:
    if __name__ == "__main__":
        main()
