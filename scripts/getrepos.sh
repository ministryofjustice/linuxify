#!/usr/bin/env bash

export REPOPATH="${HOME}/gitrepos/moj"

mkdir -p "${REPOPATH}" || exit 1

cd "${REPOPATH}" || exit 1
mkdir -p all_repos
cd all_repos || exit 1

repositories=(
  "cloud-operations-slack-bot git@github.com:ministryofjustice/cloud-operations-slack-bot"
  "diso-devops-ami-builder git@github.com:ministryofjustice/diso-devops-ami-builder"
  "diso-devops-module-ssm-bastion git@github.com:ministryofjustice/diso-devops-module-ssm-bastion"
  "juniper-mist-integration git@github.com:ministryofjustice/juniper-mist-integration"
  "linuxify git@github.com:ministryofjustice/linuxify"
  "mojo-aws-github-oidc-provider git@github.com:ministryofjustice/mojo-aws-github-oidc-provider"
  "network-access-control-admin git@github.com:ministryofjustice/network-access-control-admin"
  "network-access-control-disaster-recovery git@github.com:ministryofjustice/network-access-control-disaster-recovery"
  "network-access-control-infrastructure git@github.com:ministryofjustice/network-access-control-infrastructure"
  "network-access-control-integration-tests git@github.com:ministryofjustice/network-access-control-integration-tests"
  "network-access-control-server git@github.com:ministryofjustice/network-access-control-server"
  "nvvs-containers git@github.com:ministryofjustice/nvvs-containers"
  "nvvs-devops git@github.com:ministryofjustice/nvvs-devops"
  "nvvs-devops-github-actions git@github.com:ministryofjustice/nvvs-devops-github-actions"
  "nvvs-devops-monitor git@github.com:ministryofjustice/nvvs-devops-monitor"
  "staff-device-dhcp-server git@github.com:ministryofjustice/staff-device-dhcp-server"
  "staff-device-dns-dhcp-admin git@github.com:ministryofjustice/staff-device-dns-dhcp-admin"
  "staff-device-dns-dhcp-disaster-recovery git@github.com:ministryofjustice/staff-device-dns-dhcp-disaster-recovery"
  "staff-device-dns-dhcp-infrastructure git@github.com:ministryofjustice/staff-device-dns-dhcp-infrastructure"
  "staff-device-dns-server git@github.com:ministryofjustice/staff-device-dns-server"
  "staff-device-logging-dns-dhcp-integration-tests git@github.com:ministryofjustice/staff-device-logging-dns-dhcp-integration-tests"
  "staff-device-logging-infrastructure git@github.com:ministryofjustice/staff-device-logging-infrastructure"
  "staff-device-private-dns-zone git@github.com:ministryofjustice/staff-device-private-dns-zone"
  "staff-device-shared-services-infrastructure git@github.com:ministryofjustice/staff-device-shared-services-infrastructure"
  "staff-infrastructure-admin-sso git@github.com:ministryofjustice/staff-infrastructure-admin-sso"
  "staff-infrastructure-certificate-services git@github.com:ministryofjustice/staff-infrastructure-certificate-services"
  "staff-infrastructure-monitoring-app-reachability git@github.com:ministryofjustice/staff-infrastructure-monitoring-app-reachability"
  "staff-infrastructure-monitoring-blackbox-exporter git@github.com:ministryofjustice/staff-infrastructure-monitoring-blackbox-exporter"
  "staff-infrastructure-monitoring-dns-reachability git@github.com:ministryofjustice/staff-infrastructure-monitoring-dns-reachability"
  "staff-infrastructure-monitoring-snmpexporter git@github.com:ministryofjustice/staff-infrastructure-monitoring-snmpexporter"
  "staff-infrastructure-network-operations git@github.com:ministryofjustice/staff-infrastructure-network-operations"
  "staff-infrastructure-network-services git@github.com:ministryofjustice/staff-infrastructure-network-services"
  "staff-infrastructure-smtp-relay-server git@github.com:ministryofjustice/staff-infrastructure-smtp-relay-server"
  "staff-technology-services-github-teams git@github.com:ministryofjustice/staff-technology-services-github-teams"
  "tech-docs-monitor git@github.com:ministryofjustice/tech-docs-monitor"
  "transit-gateways git@github.com:ministryofjustice/transit-gateways"
)

clone_repo() {
  repo_name="$1"
  repo_url="$2"
  if [[ -d "${repo_name}" ]]; then
    echo "Repository '${repo_name}' already exists. Moving to the next step..."
  else
    git clone "${repo_url}"
  fi
}

for repo in "${repositories[@]}"; do
  clone_repo "${repo% *}" "${repo#* }"
done

cd "${REPOPATH}" || exit 1

mkdir -p Our_Products
cd Our_Products || exit 1

mkdir -p others && cd others || exit 1
clone_repo "staff-infrastructure-network-services" "git@github.com:ministryofjustice/staff-infrastructure-network-services"
cd ../

mkdir -p DNS && cd DNS || exit 1
clone_repo "staff-device-dns-dhcp-admin" "git@github.com:ministryofjustice/staff-device-dns-dhcp-admin.git"
clone_repo "staff-device-dns-server" "git@github.com:ministryofjustice/staff-device-dns-server.git"
clone_repo "staff-device-dns-dhcp-disaster-recovery" "git@github.com:ministryofjustice/staff-device-dns-dhcp-disaster-recovery.git"
clone_repo "staff-device-logging-dns-dhcp-integration-tests" "git@github.com:ministryofjustice/staff-device-logging-dns-dhcp-integration-tests.git"
clone_repo "staff-device-shared-services-infrastructure" "git@github.com:ministryofjustice/staff-device-shared-services-infrastructure.git"
cd ../

mkdir -p DHCP && cd DHCP || exit 1
clone_repo "staff-device-dns-dhcp-admin" "git@github.com:ministryofjustice/staff-device-dns-dhcp-admin.git"
clone_repo "staff-device-dhcp-server" "git@github.com:ministryofjustice/staff-device-dhcp-server.git"
clone_repo "staff-device-dns-dhcp-disaster-recovery" "git@github.com:ministryofjustice/staff-device-dns-dhcp-disaster-recovery.git"
clone_repo "staff-device-shared-services-infrastructure" "git@github.com:ministryofjustice/staff-device-shared-services-infrastructure.git"
cd ../

mkdir -p IMAP && cd IMAP || exit 1
clone_repo "nvvs-devops-monitor" "git@github.com:ministryofjustice/nvvs-devops-monitor.git"
cd ../

mkdir -p NACS && cd NACS || exit 1
clone_repo "network-access-control-admin" "git@github.com:ministryofjustice/network-access-control-admin.git"
cd ../

mkdir -p Log_Shipping && cd Log_Shipping || exit 1
clone_repo "staff-device-logging-infrastructure" "git@github.com:ministryofjustice/staff-device-logging-infrastructure.git"
cd ../

mkdir -p PKI && cd PKI || exit 1
clone_repo "staff-infrastructure-certificate-services" "git@github.com:ministryofjustice/staff-infrastructure-certificate-services.git"
cd ../

mkdir -p SMTP && cd SMTP || exit 1
clone_repo "staff-infrastructure-smtp-relay-server" "git@github.com:ministryofjustice/staff-infrastructure-smtp-relay-server.git"
cd ../

mkdir -p Tech_Docs_Monitor && cd Tech_Docs_Monitor || exit 1
clone_repo "tech-docs-monitor" "git@github.com:ministryofjustice/tech-docs-monitor.git"
cd ../

ls

cd ../
ls
