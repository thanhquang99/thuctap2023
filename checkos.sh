#!/bin/bash

# Function to get distribution information
function get_distribution {
    if [ -e /etc/os-release ]; then
        source /etc/os-release
        DISTRIBUTION=$ID
        VERSION=$VERSION_ID
    elif [ -e /etc/lsb-release ]; then
        source /etc/lsb-release
        DISTRIBUTION=$DISTRIB_ID
        VERSION=$DISTRIB_RELEASE
    fi
}

# Function to check Ubuntu version
function check_ubuntu_version {
    get_distribution
    if [ "$DISTRIBUTION" == "ubuntu" ]; then
        echo "Distribution: Ubuntu"
        echo "Version: $VERSION"
    else
        echo "This system is not running Ubuntu."
    fi
}

# Main function
function main {
    echo "Checking Ubuntu version..."
    check_ubuntu_version
}

# Call the main function
main

