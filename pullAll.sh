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
cd ~/Code/batch/iqdp-progress-service;print_dir; git pull origin master;
cd ~/Code/batch/qproto-tools; print_dir; git pull origin master;
cd ~/Code/batch/config-utils; print_dir; git pull origin master;
cd ~/Code/batch/shared-qamelfiles; print_dir; git pull origin master;


# Realtime
cd ~/Code/realtime/API; print_dir; git pull origin develop; print_dir;
cd ~/Code/realtime/ae-ingestion-spark; print_dir; git pull origin develop;
cd ~/Code/realtime/data-platform-tests; print_dir; git pull origin master;

# Analytics Platform
cd ~/Code/analytics-platform/ae-common; print_dir; git pull origin master;
cd ~/Code/analytics-platform/aeConfigToConsul; print_dir; git pull origin master;
cd ~/Code/analytics-platform/docker-images; print_dir; git pull origin master;
cd ~/Code/analytics-platform/data-pipeline-docker; print_dir; git pull origin master;
cd ~/Code/analytics-platform/spark-cluster-docker; print_dir; git pull origin master;

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
