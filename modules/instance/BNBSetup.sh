#!/bin/bash
sudo apt update
sudo apt-get install wget jq unzip aria2 lz4 -y
export BSC_GETH_RELEASE=v1.1.18_hf
echo $BSC_GETH_RELEASE
cd $HOME
mkdir binaries && cd binaries
wget https://github.com/bnb-chain/bsc/releases/download/$BSC_GETH_RELEASE/geth_linux
mv geth_linux geth
chmod +x *
sudo mv * /usr/bin/
# verify version
geth version
cd $HOME
mkdir $HOME/.bsc/config
cd $HOME/.bsc/config wget https://github.com/binance-chain/bsc/releases/download/$BSC_GETH_RELEASE/testnet.zip
unzip testnet.zip
rm testnet.zip
geth --datadir $HOME/.bsc init genesis.json
sudo tee /etc/systemd/system/geth.service > /dev/null <<EOF
[Unit]
Description=Geth node
After=online.target
 
[Service]
Type=simple
User=root 
ExecStart=/usr/bin/geth --config $HOME/.bsc/config/config.toml --txlookuplimit=0 --syncmode=full --tries-verify-mode=none --pruneancient=true --diffblock=5000 --cache 8000 --rpc.allow-unprotected-txs --datadir $HOME/.bsc --http --http.vhosts "*" --http.addr 0.0.0.0 --ws --ws.origins '*' --ws.addr 0.0.0.0 --http.port 8545
Restart=on-failure
RestartSec=3
LimitNOFILE=4096
 
[Install]
WantedBy=multi-user.target
EOF
sed -i '/Node.LogConfig/s/^/#/' $HOME/.bsc/config/config.toml
sed -i '/FilePath/s/^/#/' $HOME/.bsc/config/config.toml
sed -i '/MaxBytesSize/s/^/#/' $HOME/.bsc/config/config.toml
sed -i '/Level/s/^/#/' $HOME/.bsc/config/config.toml
sed -i '/FileRoot/s/^/#/' $HOME/.bsc/config/config.toml
sudo systemctl daemon-reload
sudo systemctl enable geth
sudo systemctl restart geth
sed -i 's/#Storage=auto/Storage=persistent/g' /etc/systemd/journald.conf
sudo systemctl restart systemd-journald
journalctl -u geth.service -f -n 100 -o cat
