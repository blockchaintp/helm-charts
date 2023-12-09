/*
 * Copyright © 2023 Paravela Limited All Rights Reserved
 *
 * License: Product
 */

const secretValue = (daml) => {
  if (daml.postgres) {
    return daml.postgres.secret
  }
  return null
}

const summary = (values) => {
  const {
    deployment,
    daml,
  } = values

  return [{
    title: 'Deployment Name',
    value: deployment.name,
  }, {
    title: 'Namespace',
    value: deployment.namespace,
  }, {
    title: 'DAML DB Connection Secret',
    value: secretValue(daml),
  }, {
    title: 'DAML Ledger ID',
    value: daml.ledgerId,
  }, {
    title: 'QLDB Ledger Name',
    value: daml.ledgerId,
  }, {
    title: 'DAML GRPC Port',
    value: '39000',
  }]
}

module.exports = summary
