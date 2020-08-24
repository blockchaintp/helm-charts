/*
 * Copyright © 2020 Blockchain Technology Partners Limited All Rights Reserved
 *
 * License: Product
 */

const options = require('./options')

const getConsensusTitle =
    (value) => {
      const option = options.consensus.find(o => o.value == value)
      return option ? option.title : 'unknown'
    }

const summary = (values) => {
  const {
    daml,
    besu,
    deployment,
  } = values

  return [
    {
      title: 'Deployment Name',
      value: deployment.name,
    },
    {
      title: 'Namespace',
      value: deployment.namespace,
    },
    {title: 'DAML GRPC Port', value: '39000'}
  ]
};

module.exports = summary
