set -o nounset # exit when trying to use undeclared variables

YKMAN="$HOME/.local/bin/yubikey-manager ykman"

# write challange response
SERIAL_NUMBER=$($YKMAN info | grep "Serial number: ")
SERIAL_NUMBER=$(echo "$SERIAL_NUMBER" | sed "s/Serial number: //g")


if [ ! -d /etc/Yubico/challange-responses ]; then
    sudo mkdir -p /etc/Yubico/challange-responses
fi

if [ ! -f /etc/Yubico/challange-responses/$(whoami)-${SERIAL_NUMBER} ]; then
    ykpamcfg -2
    if [ ! -f $HOME/.yubico/challenge-${SERIAL_NUMBER} ]; then
        echo "Chalresp not found, exiting"
        exit 1
    fi


    sudo mv $HOME/.yubico/challenge-${SERIAL_NUMBER} /etc/Yubico/challange-responses/$(whoami)-${SERIAL_NUMBER}
else
    echo "Chalresp for this yubikey already done!"
fi


if [ ! -f "/etc/pam.d/yubikey-chalresp-required" ]; then
    echo "auth       required     pam_yubico.so mode=challenge-response chalresp_path=/etc/Yubico/challange-responses" | sudo tee /etc/pam.d/yubikey-chalresp-required
else
    echo "/etc/pam.d/yubikey-chalresp-required already there!"
fi

if [ ! -f "/etc/pam.d/yubikey-chalresp-sufficient" ]; then
    echo "auth       sufficient   pam_yubico.so mode=challenge-response chalresp_path=/etc/Yubico/challange-responses" | sudo tee /etc/pam.d/yubikey-chalresp-sufficient
else
    echo "/etc/pam.d/yubikey-chalresp-sufficient already there!"
fi

exit 0
