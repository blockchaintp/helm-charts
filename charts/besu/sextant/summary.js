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
    Values,
  } = values

  return [
    {
      title: 'Deployment Name',
      value: Values.name,
    },
    {
      title: 'Namespace',
      value: Values.namespace,
    },
    {
      title: 'Genesis Block',
      value: Values.genesis.enabled ? 'Yes' : 'No',
    },
    {
      title: 'External Seeds',
      value: Values.externalSeeds.map(seed => seed.address),
    },
    {title: 'DAML GRPC Port', value: '39000'}
  ]
};

module.exports = summary
