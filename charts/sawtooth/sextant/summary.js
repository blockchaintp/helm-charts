const options = require('./options')

const getConsensusTitle = (value) => {
  const option = options.consensus.find(o => o.value == value)
  return option ? option.title : 'unknown'
}

const summary = (values) => {

  const {
    sawtooth,
  } = values

  return [{
    title: 'Network Name',
    value: sawtooth.networkName,
  }, {
    title: 'Namespace',
    value: sawtooth.namespace,
  }, {
    title: 'Peering Type',
    value: sawtooth.dynamicPeering ? 'Dynamic' : 'Static',
  }, {
    title: 'Genesis Block',
    value: sawtooth.genesis.enabled ? 'Yes' : 'No',
  }, {
    title: 'Permissioned',
    value: sawtooth.permissioned ? 'Yes' : 'No',
  }, {
    title: 'Consensus Algorithm',
    value: getConsensusTitle(sawtooth.consensus),
  }, {
    title: 'External Seeds',
    value: sawtooth.externalSeeds.map(seed => seed.ip),
  }, {
    title: 'Sawtooth Validator Port',
    value: '8800'
  }, {
    title: 'Custom Transaction Processors',
    value: sawtooth.customTPs.map(tp => `${tp.name} (${tp.image})`),
  }, {
    title: 'Sabre enabled?',
    value: sawtooth.sabre.enabled ? 'Yes' : 'No',
  }, {
    title: 'SETH enabled?',
    value: sawtooth.seth.enabled ? 'Yes' : 'No',
  }, {
    title: 'XO enabled?',
    value: sawtooth.xo.enabled ? 'Yes' : 'No',
  }, {
    title: 'Smallbank enabled?',
    value: sawtooth.smallbank.enabled ? 'Yes' : 'No',
  }]
}

module.exports = summary



