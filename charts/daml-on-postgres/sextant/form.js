const options = require('./options')
//`^[a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*`
const form = [

  'Network',

  [
    {
      id: 'deployment.name',
      title: 'Network Name',
      helperText: 'The name of the DAML on Aurora Deployment',
      component: 'text',
      editable: {
        new: true,
      },
      validate: {
        type: 'string',
        methods: [
          ['required', 'Required'],
          ['matches', [`^[a-z]([-a-z0-9]*[a-z0-9])*$`], "a DNS-1123 label must consist of lower case alphanumeric characters or '-', and must start and end with an alphanumeric character"]
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
          ['matches', [`^[a-z]([-a-z0-9]*[a-z0-9])*$`], "a DNS-1123 label must consist of lower case alphanumeric characters or '-', and must start and end with an alphanumeric character"]
        ],
      },
    },

  ],

  'DAML Details',
  [
    {
      id: 'daml.ledgerId',
      title: 'DAML Ledger ID',
      helperText: 'A unique string identying this ledger',
      component: 'text',
      editable: {
        new: true,
      },
      validate: {
        type: 'string',
        methods: [
          ['required', 'Required'],
          ['matches', [`^[a-zA-Z]([-a-zA-Z0-9]*[a-zA-Z0-9])*$`], "a ledger id must consist of alphanumeric characters or '-', and must start and end with an alphanumeric character"]
        ],
      },
    },
    ''//empty string for form spacing
  ],

  {
    id: 'postgres.enabled',
    title: 'Postgres Enabled',
    helperText:
      'If enabled, a local postgres database instance will be created',
    component: 'radio',
    default: false,
    dataType: 'boolean',
    editable: {
      new: true,
    },
    row: true,
    options: options.activated,
    validate: {
      type: 'string',
      methods: [['required', 'Required']],
    },
  },
  {
    id: 'postgres.persistence.enabled',
    title: 'Postgres Persistence',
    helperText:
      'If enabled data will be stored on PersistentVolumeClaims ',
    component: 'radio',
    default: false,
    dataType: 'boolean',
    editable: {
      new: true,
    },
    row: true,
    options: options.activated,
    linked: {
      linkedId: 'postgres.enabled',
      visibilityParameter: 'true' // for what value of linkedId, will this component be visible
    },
    validate: {
      type: 'string',
      methods: [['required', 'Required']],
    },
  },
  {
    id: 'postgres.persistence.storageClass',
    title: 'Postgres StorageClass',
    helperText: 'The name of the StorageClass for the PersistentVolumeClaims',
    component: 'text',
    default: null,
    editable: {
      new: true,
    },
    linked: {
      linkedId: 'postgres.persistence.enabled',
      visibilityParameter: 'true' // for what value of linkedId, will this component be visible
    },
    validate: {
      type: 'string',
      methods: [
        [
          'matches', [`^[a-z]([-a-z0-9]*[a-z0-9])*$`],
          'a DNS-1123 label must consist of lower case alphanumeric characters or \'-\', and must start and end with an alphanumeric character'
        ]
      ],
    },
  },

  'Postgres Credentials',
  {
    id: 'passwordOrSecret',
    title: 'Password Or Secret',
    helperText: 'Choose whether to enter a database password or the name of a secret',
    component: 'radio',
    default: true,
    dataType: 'boolean',
    row: true,
    options: options.passwordOrSecret,
    validate: {
      type: 'string',
      methods: [
        ['required', 'Required']
      ],
    },
  },
  {
    id: 'postgres.password',
    title: 'Postgres Password',
    helperText: 'The password for the postgres instance',
    component: 'text',
    default: null,
    linked: {
      linkedId: 'passwordOrSecret',
      visibilityParameter: 'true' // for what value of linkedId, will this component be visible
    },
    validate: {
      type: 'string',
      methods: [
        [
          'matches', [`^[a-z]([-a-z0-9]*[a-z0-9])*$`],
          'a DNS-1123 label must consist of lower case alphanumeric characters or \'-\', and must start and end with an alphanumeric character'
        ]
      ],
    },
  },
  {
    id: 'postgres.existingPasswordSecret',
    title: 'Postgres Password Secret Name',
    helperText: 'The name of a pre-existing secret with a field "password" containing the password of the postgres instance',
    component: 'text',
    default: null,
    linked: {
      linkedId: 'passwordOrSecret',
      visibilityParameter: 'false' // for what value of linkedId, will this component be visible
    },
    validate: {
      type: 'string',
      methods: [
        [
          'matches', [`^[a-z]([-a-z0-9]*[a-z0-9])*$`],
          'a DNS-1123 label must consist of lower case alphanumeric characters or \'-\', and must start and end with an alphanumeric character'
        ]
      ],
    },
  },



  'Image Pull Secrets',

  {
    id: 'imagePullSecrets.enabled',
    title: 'Do you need to enable image pull secrets?',
    helperText: 'Provide secrets to be injected into Sawtooth namespace and used to pull images from your secure registry',
    component: 'radio',
    default: false,
    dataType: 'boolean',
    row: true,
    options: options.yesNo,
    validate: {
      type: 'string',
      methods: [
        ['required', 'Required']
      ],
    },
  }, {
    id: 'imagePullSecrets.value',
    title: 'Image Pull Secrets',
    helperText: null,
    default: null,
    linked: {
      linkedId: 'imagePullSecrets.enabled',
      visibilityParameter: 'true' // for what value of linkedId, will this component be visible
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
            ['matches', [`^[a-z]([-a-z0-9]*[a-z0-9])*$`], "a DNS-1123 label must consist of lower case alphanumeric characters or '-', and must start and end with an alphanumeric character"]
          ],
        },
      }],
      table: [{
        title: 'Name',
        name: 'name',
      }]
    }
  },


]

module.exports = form
