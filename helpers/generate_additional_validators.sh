#!/usr/bin/env bash

rm -f validators.txt

# Read the mnemonic from the file
MNEMONIC=$(<mnemonic1.txt)

eth2-val-tools deposit-data --fork-version 0x99000000 --source-max 43 --source-min 0 --validators-mnemonic="$MNEMONIC" --withdrawals-mnemonic="$MNEMONIC" --as-json-list | jq ".[] | \"0x\" + .pubkey + \":\" + .withdrawal_credentials + \":5000000000000\"" | tr -d '"' >> validators.txt

MNEMONIC=$(<mnemonic2.txt)

eth2-val-tools deposit-data --fork-version 0x99000000 --source-max 43 --source-min 0 --validators-mnemonic="$MNEMONIC" --withdrawals-mnemonic="$MNEMONIC" --as-json-list | jq ".[] | \"0x\" + .pubkey + \":\" + .withdrawal_credentials + \":5000000000000\"" | tr -d '"' >> validators.txt

MNEMONIC=$(<mnemonic3.txt)

eth2-val-tools deposit-data --fork-version 0x99000000 --source-max 43 --source-min 0 --validators-mnemonic="$MNEMONIC" --withdrawals-mnemonic="$MNEMONIC" --as-json-list | jq ".[] | \"0x\" + .pubkey + \":\" + .withdrawal_credentials + \":5000000000000\"" | tr -d '"' >> validators.txt