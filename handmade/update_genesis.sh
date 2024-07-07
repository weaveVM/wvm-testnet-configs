# Constants for mainnet preset
SLOT_PER_EPOCH=32
SECONDS_PER_SLOT=2

# Define the fork epochs (replace these with your actual values)
CAPELLA_FORK_EPOCH=1
DENEB_FORK_EPOCH=2

genesis_file="genesis.json"
config_file="config.yaml"
genesis_ssz="genesis.ssz"

# Get current timestamps
CURRENT_TIMESTAMP=$(date +%s)
CURRENT_TIMESTAMP_HEX=$(printf '0x%x\n' $CURRENT_TIMESTAMP)
echo "current_timestamp=$CURRENT_TIMESTAMP"
echo "current_timestamp_hex=$CURRENT_TIMESTAMP_HEX"

# Update timestamps in genesis.json and config.yml
sed -i '' 's/"timestamp":.*$/"timestamp": "'"$CURRENT_TIMESTAMP_HEX"'",/' $genesis_file
sed -i '' 's/MIN_GENESIS_TIME:.*/MIN_GENESIS_TIME: '"$CURRENT_TIMESTAMP"'/' $config_file

# Regenerate genesis.ssz with updated timestamp values
eth2-testnet-genesis merge \
  --config "./$config_file" \
  --eth1-config "./$genesis_file" \
  --mnemonics "./mnemonic.yaml" \
  --state-output "./$genesis_ssz" \
  --tranches-dir "./tranches"

# Update future hardforks time in the EL genesis file based on the CL genesis time
GENESIS_TIME=$(zcli pretty deneb BeaconState $genesis_ssz | jq -r '.genesis_time')
echo "genesis_time=$GENESIS_TIME"

CAPELLA_TIME=$((GENESIS_TIME + (CAPELLA_FORK_EPOCH * SLOT_PER_EPOCH * SECONDS_PER_SLOT)))
echo "capella_time=$CAPELLA_TIME"
sed -i '' 's/"shanghaiTime".*$/\"shanghaiTime\": '"$CAPELLA_TIME"',/' $genesis_file

CANCUN_TIME=$((GENESIS_TIME + (DENEB_FORK_EPOCH * SLOT_PER_EPOCH * SECONDS_PER_SLOT)))
echo "cancun_time=$CANCUN_TIME"
sed -i '' 's/"cancunTime".*$/\"cancunTime\": '"$CANCUN_TIME"',/' $genesis_file

# Display updated genesis.json
cat $genesis_file

# Display updated config.yml
cat $config_file