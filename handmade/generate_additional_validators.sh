#!/usr/bin/env bash

rm -f validators.txt

MNEMONIC="kiwi wet deer orchard column detect extra tooth bar pact extend lunch dream idle join cereal near success decorate shoulder grace cup public diet"
eth2-val-tools deposit-data --fork-version 0x99000000 --source-max 43 --source-min 0 --validators-mnemonic="$MNEMONIC" --withdrawals-mnemonic="$MNEMONIC" --as-json-list | jq ".[] | \"0x\" + .pubkey + \":\" + .withdrawal_credentials + \":5000000000000\"" | tr -d '"' >> validators.txt

MNEMONIC="memory mind rebel leg victory medal utility define success since flag aim barely clog recall napkin middle elephant utility throw muscle cool bitter history"
eth2-val-tools deposit-data --fork-version 0x99000000 --source-max 43 --source-min 0 --validators-mnemonic="$MNEMONIC" --withdrawals-mnemonic="$MNEMONIC" --as-json-list | jq ".[] | \"0x\" + .pubkey + \":\" + .withdrawal_credentials + \":5000000000000\"" | tr -d '"' >> validators.txt

MNEMONIC="deny utility range retreat dentist find airport emerge rabbit result marine bike cactus museum canoe pluck never normal now hip ocean confirm toilet electric"
eth2-val-tools deposit-data --fork-version 0x99000000 --source-max 42 --source-min 0 --validators-mnemonic="$MNEMONIC" --withdrawals-mnemonic="$MNEMONIC" --as-json-list | jq ".[] | \"0x\" + .pubkey + \":\" + .withdrawal_credentials + \":5000000000000\"" | tr -d '"' >> validators.txt
