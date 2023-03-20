#!/bin/bash
oc new-project postfix || true
oc project postfix
#oc label --overwrite ns postfix  pod-security.kubernetes.io/enforce=privileged
oc new-build --strategy docker --binary --name postfix
oc start-build postfix --from-dir=. --follow
oc create sa postfix
oc adm policy add-scc-to-user anyuid -z postfix
oc create -f service-nodeport.yaml
#oc create -f service.yaml
#oc create route passthrough --service=postfix
oc annotate service postfix service.beta.openshift.io/serving-cert-secret-name=postfix
oc create configmap postfix
oc annotate configmap postfix service.beta.openshift.io/inject-cabundle=true
oc create -f deployment.yaml
