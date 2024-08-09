#!/usr/bin/env bash

rm -f validators.txt

MNEMONIC="mnemonic number one"
eth2-val-tools deposit-data --fork-version 0x99000000 --source-max 1 --source-min 0 --validators-mnemonic="$MNEMONIC" --withdrawals-mnemonic="$MNEMONIC" --as-json-list | jq ".[] | \"0x\" + .pubkey + \":\" + .withdrawal_credentials + \":5000000000000\"" | tr -d '"' >> validators.txt


MNEMONIC="mnemonic number two" 
eth2-val-tools deposit-data --fork-version 0x99000000 --source-max 1 --source-min 0 --validators-mnemonic="$MNEMONIC" --withdrawals-mnemonic="$MNEMONIC" --as-json-list | jq ".[] | \"0x\" + .pubkey + \":\" + .withdrawal_credentials + \":5000000000000\"" | tr -d '"' >> validators.txt
