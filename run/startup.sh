#! /usr/bin/bash
cd /app
/chia-blockchain/venv/bin/chia init
/chia-blockchain/venv/bin/chia keys add -f ${mnemonic}
cp /root/.chia/${chia_config} /app/config.yaml
source ./venv/bin/activate
python manager.py start