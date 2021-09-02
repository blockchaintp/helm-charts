const options = require('./options')

const getConsensusTitle = (value) => {
  const option = options.consensus.find((o) => o.value === value)
  return option ? option.title : 'unknown'
}

const summary = (values) => {
  const {
    sawtooth,
  } = values

  return [{
    title: 'Deployment Name',
    value: sawtooth.networkName,
  }, {
    title: 'Namespace',
    value: sawtooth.namespace,
  }, {
    title: 'Genesis Block',
    value: sawtooth.sawtooth.genesis.enabled ? 'Yes' : 'No',
  }, {
    title: 'Permissioned',
    value: sawtooth.sawtooth.permissioned ? 'Yes' : 'No',
  }, {
    title: 'Consensus Algorithm',
    value: getConsensusTitle(sawtooth.sawtooth.consensus),
  }, {
    title: 'External Seeds',
    value: sawtooth.sawtooth.externalSeeds.map((seed) => seed.ip),
  }, {
    title: 'Sawtooth Validator Port',
    value: '8800',
  }, {
    title: 'Custom Transaction Processors',
    value: sawtooth.sawtooth.customTPs.map((tp) => `${tp.name} (${tp.image})`),
  }]
}

module.exports = summary
