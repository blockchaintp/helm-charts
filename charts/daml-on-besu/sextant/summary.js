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
    daml_on_besu,
  } = values

  return [
    {
      title: 'Deployment Name',
      value: daml_on_besu.name,
    },
    {
      title: 'Namespace',
      value: daml_on_besu.namespace,
    },
    {title: 'DAML GRPC Port', value: '39000'}
  ]
};

module.exports = summary
