#!/bin/sh

rm -f *.deb *.rpm

distributor=`lsb_release -i | awk '{ print $NF }'`
if [ -z "$distributor" ]; then
        echo "lsb_release -i failed to give distro identifier"
        exit 1
elif [ x"$distributor" = x"Ubuntu" -o x"$distributor" = x"Debian" ]; then
        ./build-apt.sh
	exit $?
elif [ x"$distributor" = x"RedHatEnterpriseServer" ]; then
        ./build-rpms.sh
	exit $?
fi
