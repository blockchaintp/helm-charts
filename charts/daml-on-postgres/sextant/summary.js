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
      title: 'Daml DB Connection Secret',
      value: secretValue(daml),
    }, {
      title: 'Daml Ledger ID',
      value: daml.ledgerId,
    },
  ]
}

module.exports = summary
