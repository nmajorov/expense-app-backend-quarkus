#!/bin/env bash

#source $HOME/set_gralvm.sh

#get current script dir
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $SCRIPT_DIR

echo "run with postgresql profile"
export POSTGRESQL_SERVICE_NAME=127.0.0.1


export POSTGRESQL_USER=keycloak
export POSTGRESQL_PASSWORD=keycloak
export POSTGRESQL_DATABASE=root

#echo $(env | grep POSTGRESQL)



# keycloak properties
export KEYCLOAK_URL="http://localhost:7080/auth/realms/basic"
export KEYCLOAK_INTROSPECT_URL="$KEYCLOAK_URL/protocol/openid-connect/token/introspect"
export KEYCLOAK_CLIENT_ID="backend"
export KEYCLOAK_SECRET="16c3384b-725d-410d-8107-df3319165f70"
#export KEYCLOAK_SECRET="b530c9d1-45f0-4f30-87d2-471530534c4a"


mvn  clean package -Pnative -e -B -DskipTests -Dmaven.javadoc.skip=true -Dmaven.site.skip=true -Dmaven.source.skip=true -Djacoco.skip=true -Dcheckstyle.skip=true -Dfindbugs.skip=true -Dpmd.skip=true -Dfabric8.skip=true
