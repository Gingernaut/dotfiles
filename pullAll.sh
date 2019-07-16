print_dir() {
  echo "\n---------------------"
  pwd
  echo "---------------------\n \n"
}

#### Batch
# develop
cd ~/Code/batch/emr-scheduler; print_dir; git pull origin develop;
cd ~/Code/batch/authoritative-records-store; print_dir; git pull origin develop;
# master
cd ~/Code/batch/ars-api; print_dir; git pull origin master;
cd ~/Code/batch/datalake-egress-api; print_dir; git pull origin master;
cd ~/Code/batch/datalake-egress-processor; print_dir; git pull origin master;
cd ~/Code/batch/datalake-egress-shared; print_dir; git pull origin master;
cd ~/Code/batch/qproto-tools; print_dir; git pull origin master;
cd ~/Code/batch/config-utils; print_dir; git pull origin master;
cd ~/Code/batch/shared-qamelfiles; print_dir; git pull origin master;

cd ~/Code/batch/iq-data-platform-gateway; print_dir; git pull origin master;

cd ~/Code/batch/iq-progress-service;print_dir; git pull origin master;
cd ~/Code/batch/iq-spark-scheduler; print_dir; git pull origin master;

cd ~/Code/batch/spark-2.4; print_dir; git pull origin master;

cd ~/Code/batch/snapshot-reencryption; print_dir; git pull origin master;
cd ~/Code/batch/snapshot-deletion-script; print_dir; git pull origin master;
cd ~/Code/batch/export-deletion-script; print_dir; git pull origin master;
cd ~/Code/batch/lake-patrol; print_dir; git pull origin master;

# Nomad
cd ~/Code/nomad/qamel-driver; print_dir; git pull origin master;
cd ~/Code/nomad/nomad-spark-base; print_dir; git pull origin master;
cd ~/Code/nomad/nomad-app-base; print_dir; git pull origin master;
cd ~/Code/nomad/spark-sidecar; print_dir; git pull origin master;

# General
cd ~/Code/hiera; print_dir; git pull origin master;
cd ~/Code/vault; print_dir; git pull origin master;
cd ~/Code/vault-govcloud; print_dir; git pull origin master;
cd ~/Documents/aqqountant; print_dir; git pull origin master;
