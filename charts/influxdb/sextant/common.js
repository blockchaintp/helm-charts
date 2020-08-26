const options = require('./options')
const validators = require('./validators')

const deploymentFields = [
  {
    id: 'deployment.name',
    title: 'Network Name',
    helperText: 'The name of the Deployment',
    component: 'text',
    editable: {
      new: true,
    },
    validate: {
      type: 'string',
      methods: [
        ['required', 'Required'],
        validators.dns1123,
      ],
    },
  },
  {
    id: 'deployment.namespace',
    title: 'Kubernetes Namespace',
    helperText: 'The Kubernetes namespace',
    component: 'text',
    editable: {
      new: true,
    },
    validate: {
      type: 'string',
      methods: [
        ['required', 'Required'],
        validators.dns1123,
      ],
    },
  },
]

const affinityEnabled = {
  id: 'affinity.enabled',
  title: 'Affinity',
  helperText:
    'If enabled - pods will only deploy to nodes that have the label: app={{.sawtooth.networkName}}-validator',
  component: 'radio',
  default: false,
  dataType: 'boolean',
  row: true,
  options: options.activated,
  validate: {
    type: 'string',
    methods: [['required', 'Required']],
  },
}

const imagePullSecretsSwitch = {
  id: 'imagePullSecrets.enabled',
  title: 'Do you need to enable image pull secrets?',
  helperText:
    'Provide secrets to be injected into Sawtooth namespace and used to pull images from your secure registry',
  component: 'radio',
  default: false,
  dataType: 'boolean',
  row: true,
  options: options.yesNo,
  validate: {
    type: 'string',
    methods: [['required', 'Required']],
  },
}

const imagePullSecretsValue = {
  id: 'influxdb.image.pullSecrets',
  title: 'Image Pull Secrets',
  helperText: null,
  default: null,
  linked: {
    linkedId: 'imagePullSecrets.enabled',
    visibilityParameter:
      'true', // for what value of linkedId, will this component be visible
  },
  list: {
    mainField: 'name',
    schema: [{
      id: 'name',
      title: 'Name',
      helperText: 'The name of the secret',
      component: 'text',
      validate: {
        type: 'string',
        methods: [
          ['required', 'Required'],
          validators.dns1123,
        ],
      },
    }],
    table: [{
      title: 'Name',
      name: 'name',
    }],
  },
}

module.exports = {
  deploymentFields,
  affinityEnabled,
  imagePullSecretsSwitch,
  imagePullSecretsValue,
}
