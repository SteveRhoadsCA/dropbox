# Bash file to get remote metrics run file
ssh -i ~/.ssh/id_rsa.pem srhoads@52.203.150.102 << REMOTE_CMD
cd ~/Metrics
bash harness.bash
REMOTE_CMD
scp -i ~/.ssh/id_rsa.pem srhoads@52.203.150.102:~/Metrics/metrics.out ./
