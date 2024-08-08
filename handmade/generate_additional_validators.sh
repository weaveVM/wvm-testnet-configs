#!/usr/bin/env bash

rm -f validators.txt

MNEMONIC="rose wheat tooth curtain leopard vivid agent six rose cricket mail extend deliver foot visual super potato clap witness rice spawn fan diary garment"
eth2-val-tools deposit-data --fork-version 0x99000000 --source-max 1 --source-min 0 --validators-mnemonic="$MNEMONIC" --withdrawals-mnemonic="$MNEMONIC" --as-json-list | jq ".[] | \"0x\" + .pubkey + \":\" + .withdrawal_credentials + \":5000000000000\"" | tr -d '"' >> validators.txt
MNEMONIC="laptop globe uncle crowd job uncle horse domain dentist stomach other huge silver offer despair general envelope capable slice marriage rack judge walnut brick" 
eth2-val-tools deposit-data --fork-version 0x99000000 --source-max 1 --source-min 0 --validators-mnemonic="$MNEMONIC" --withdrawals-mnemonic="$MNEMONIC" --as-json-list | jq ".[] | \"0x\" + .pubkey + \":\" + .withdrawal_credentials + \":5000000000000\"" | tr -d '"' >> validators.txt
