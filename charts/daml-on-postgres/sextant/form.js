const options = require('./options')
const validators = require('./validators')
const common = require('./common')
// `^[a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*`
const form = [

  'DAML on Postgres Deployment',

  common.deploymentFields,

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
          validators.dns1123,
        ],
      },
    },
    '', // empty string for form spacing
  ],

  {
    id: 'postgres.enabled',
    title: 'Postgres',
    helperText:
      'Should a local postgres be created, or will remote credentials be provided?',
    component: 'radio',
    default: false,
    dataType: 'boolean',
    editable: {
      new: true,
    },
    row: true,
    options: options.remoteOrLocal,
    validate: {
      type: 'string',
      methods: [['required', 'Required']],
    },
  },
  [
    {
      id: 'postgres.host',
      title: 'Host',
      helperText: 'Postgres endpoint host',
      component: 'text',
      default: 'postgres',
      editable: {
        new: true,
      },
      linked: [
        {
          linkedId: 'postgres.enabled',
          visibilityParameter: 'false', // for what value of linkedId, will this component be visible
        },
      ],
      validate: {
        type: 'string',
        methods: [
          ['required', 'Required'],
          validators.dns1123,
        ],
      },
    },
    {
      id: 'postgres.user',
      title: 'User',
      helperText: 'Postgres endpoint user',
      component: 'text',
      default: 'postgres',
      editable: {
        new: true,
      },
      linked: [
        {
          linkedId: 'postgres.enabled',
          visibilityParameter: 'false', // for what value of linkedId, will this component be visible
        },
      ],
      validate: {
        type: 'string',
        methods: [
          ['required', 'Required'],
          validators.dns1123,
        ],
      },
    },
    {
      id: 'postgres.databse',
      title: 'Database',
      helperText: 'Postgres endpoint database',
      component: 'text',
      default: 'postgres',
      editable: {
        new: true,
      },
      linked: [
        {
          linkedId: 'postgres.enabled',
          visibilityParameter: 'false', // for what value of linkedId, will this component be visible
        },
      ],
      validate: {
        type: 'string',
        methods: [
          ['required', 'Required'],
          validators.dns1123,
        ],
      },
    },
    {
      id: 'postgres.port',
      title: 'Port',
      helperText: 'Postgres endpoint port',
      component: 'text',
      default: '5432',
      editable: {
        new: true,
      },
      linked: [
        {
          linkedId: 'postgres.enabled',
          visibilityParameter: 'false', // for what value of linkedId, will this component be visible
        },
      ],
      validate: {
        type: 'string',
        methods: [
          ['required', 'Required'],
        ],
      },
    },

  ],
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
    linked: [
      {
        linkedId: 'postgres.enabled',
        visibilityParameter: 'true', // for what value of linkedId, will this component be visible
      },
    ],
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
    default: 'gp2',
    editable: {
      new: true,
    },
    linked: [
      {
        linkedId: 'postgres.enabled',
        visibilityParameter: 'true', // for what value of linkedId, will this component be visible
      },
      {
        linkedId: 'postgres.persistence.enabled',
        visibilityParameter: 'true', // for what value of linkedId, will this component be visible
      },
    ],
    validate: {
      type: 'string',
      methods: [
        validators.dns1123,
      ],
    },
  },

  'Postgres Credentials',
  {
    id: 'passwordOrSecret',
    title: 'Password Or Secret',
    helperText: 'Choose whether to enter a database password or the name of a secret',
    component: 'radio',
    default: '1',
    dataType: 'string',
    row: true,
    options: options.passwordOrSecret,
    validate: {
      type: 'boolean',
      methods: [
        ['required', 'Required'],
      ],
    },
  },
  {
    id: 'postgres.password',
    title: 'Postgres Password',
    helperText: 'The password for the postgres instance',
    component: 'text',
    default: '',
    linked: [
      {
        linkedId: 'passwordOrSecret',
        visibilityParameter: '1', // for what value of linkedId, will this component be visible
      },
    ],
    validate: {
      type: 'string',
      methods: [
        validators.password,
      ],
    },
  },
  {
    id: 'postgres.existingPasswordSecret',
    title: 'Postgres Password Secret Name',
    helperText: 'The name of a secret with a field "password" containing the database password',
    component: 'text',
    default: '',
    linked: [
      {
        linkedId: 'passwordOrSecret',
        visibilityParameter: '2', // for what value of linkedId, will this component be visible
      },
    ],
    validate: {
      type: 'string',
      methods: [
        validators.password,
      ],
    },
  },

  'Image Pull Secrets',

  common.imagePullSecretsSwitch,

  common.imagePullSecretsValue,

  'Advanced Options',

  [
    '', // Emptry string acts as space in UI
  ],

]

module.exports = form
