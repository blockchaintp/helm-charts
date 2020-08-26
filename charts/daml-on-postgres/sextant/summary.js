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

  return [
    {
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
    },
  ]
}

module.exports = summary
