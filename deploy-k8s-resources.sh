#!/bin/bash
#
# SPDX-FileCopyrightText: 2024 SAP SE or an SAP affiliate company and Gardener contributors
#
# SPDX-License-Identifier: Apache-2.0

set -o errexit

COMPONENT_DIR="$(dirname $0)/.."
cd "${COMPONENT_DIR}"
COMPONENT_DIR="$(pwd)"
echo "COMPONENT_DIR: ${COMPONENT_DIR}"

source "${COMPONENT_DIR}/commands/settings"

TMP_DIR=`mktemp -d`
echo "TMP_DIR: ${TMP_DIR}"

echo "creating podinfo installation"
outputFile="${TMP_DIR}/installation.yaml"
export namespace="${NAMESPACE}"
export context="${CONTEXT}"
export version="${VERSION}"
inputFile="${COMPONENT_DIR}/installation/installation.yaml"
envsubst < ${inputFile} > ${outputFile}
kubectl apply -f ${outputFile}

# echo "creating mongodb a2 installation"
# outputFile="${TMP_DIR}/installation.yaml"
# export namespace="${NAMESPACE}"
# export context="${CONTEXT}"
# export version="${VERSION}"
# inputFile="${COMPONENT_DIR}/installation/a2/installation.yaml.tpl"
# envsubst < ${inputFile} > ${outputFile}
# kubectl apply -f ${outputFile}

# echo "creating mongodb s1 installation"
# outputFile="${TMP_DIR}/installation.yaml"
# export namespace="${NAMESPACE}"
# export context="${CONTEXT}"
# export version="${VERSION}"
# inputFile="${COMPONENT_DIR}/installation/s1/installation.yaml.tpl"
# envsubst < ${inputFile} > ${outputFile}
# kubectl apply -f ${outputFile}
