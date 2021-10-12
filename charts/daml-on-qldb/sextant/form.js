const options = require('./options')

const form = [

  'Daml on QLDB Deployment',

  [
    {
      id: 'deployment.name',
      title: 'Deployment Name',
      helperText: 'The name of the deployment',
      component: 'text',
      editable: {
        new: true,
      },
      validate: {
        type: 'string',
        methods: [
          ['required', 'Required'],
          ['matches', ['^[a-z]([-a-z0-9]*[a-z0-9])*$'], "a DNS-1123 label must consist of lower case alphanumeric characters or '-', and must start and end with an alphanumeric character"],
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
          ['matches', ['^[a-z]([-a-z0-9]*[a-z0-9])*$'], "a DNS-1123 label must consist of lower case alphanumeric characters or '-', and must start and end with an alphanumeric character"],
        ],
      },
    },

  ],

  'Daml Details',
  [
    {
      id: 'daml.ledgerId',
      title: 'Daml Ledger ID',
      helperText: 'A unique string identying this ledger',
      component: 'text',
      editable: {
        new: true,
      },
      validate: {
        type: 'string',
        methods: [
          ['required', 'Required'],
          ['matches', ['^[a-z]([-a-z0-9]*[a-z0-9]){0,31}$'], "a ledger id must consist of alphanumeric characters or '-', and must start and end with alowercase alphanumeric character"],
        ],
      },
    },
    // empty string for form spacing
    '',
    {
      id: 'daml.region',
      title: 'AWS region for QLDB',
      helperText: 'A valid AWS region appropriate for the deployment',
      component: 'select',
      dataType: 'text',
      options: options.awsRegion,
      validate: {
        type: 'string',
        methods: [
          ['required', 'Required'],
          ['matches', ['(us(-gov)?|ap|ca|cn|eu|sa)-(central|(north|south)?(east|west)?)-\d'], "Must be a valid AWS region"],
        ],
      },
    },
    // empty string for form spacing
    '',
  ],

  'Image Pull Secrets',

  {
    id: 'imagePullSecrets.enabled',
    title: 'Do you need to enable image pull secrets?',
    helperText: 'Provide secrets to be injected into the namespace and used to pull images from your secure registry',
    component: 'radio',
    default: false,
    dataType: 'boolean',
    row: true,
    options: options.yesNo,
    validate: {
      type: 'string',
      methods: [
        ['required', 'Required'],
      ],
    },
  }, {
    id: 'imagePullSecrets.value',
    title: 'Image Pull Secrets',
    helperText: null,
    default: null,
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
            ['matches', ['^[a-z]([-a-z0-9]*[a-z0-9])*$'], "a DNS-1123 label must consist of lower case alphanumeric characters or '-', and must start and end with an alphanumeric character"],
          ],
        },
      }],
      table: [{
        title: 'Name',
        name: 'name',
      }],
    },
  },

]

module.exports = form
