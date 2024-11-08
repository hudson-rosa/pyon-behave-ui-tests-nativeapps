#!/bin/bash
#chmod +x behave_runner.py


# NATIVE APP - OFFICIAL ENVIRONMENT SETTINGS
PYON_ENVIRONMENT='staging'
PYON_TARGET='real_device'
PYON_MODE='native_app'

PYON_OS='Android'
PYON_OS_VERSION='13.0'
PYON_DEVICE='Samsung Galaxy A51'
    
    # WITH IOS
    # PYON_OS='iOS'
    # PYON_OS_VERSION='14.5'
    # PYON_DEVICE='iPhone 12'

PYON_ORIENTATION='Portrait'
PYON_LANGUAGE='en'
PYON_LOCALE='en_GB'
PYON_APP_PATH='/Users/hudsonssrosa/git_projects/pyon-behave-ui-tests-nativeapps/.resources/app_distribution/Sample.apk'
    # WITH IOS
    # PYON_APP_PATH='/Users/<PC_USER_NAME>/Library/Developer/Xcode/DerivedData/.../Build/Products/Debug-iphonesimulator/<YOUR_APP_BUILD>.app'

PYON_TAGS=
PYON_EXCLUDED_TAG='wip'

# echo 'COPYING PROPERTIES'
# cp env_settings.properties.local env_settings.properties

# echo 'UPDATING PACKAGES...'
# python3 setup_python_env_update.py

echo '\nSTARTING APPIUM SERVER...'
bash -c "\
    python3 appium_setup.py --server start & \
    sleep 7
    "

echo 'RUNNING BEHAVE TESTS...'
python3 behave_runner.py --target $PYON_TARGET \
                        --environment "$PYON_ENVIRONMENT" \
                        --mode $PYON_MODE \
                        --os "$PYON_OS" \
                        --os_version "$PYON_OS_VERSION" \
                        --device_name "$PYON_DEVICE" \
                        --orientation "$PYON_ORIENTATION" \
                        --language "$PYON_LANGUAGE" \
                        --locale "$PYON_LOCALE" \
                        --app_path "$PYON_APP_PATH" \
                        --tags "$PYON_TAGS" \
                        --exclude "$PYON_EXCLUDED_TAG"

echo '\nSTOPPING APPIUM SERVER...'
python3 appium_setup.py --server stop