const options = require('./options')
const validators = require('./validators')
const common = require('./common')
// `^[a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*`
const form = [

  'Network',

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
      visibilityParameter: 'true', // for what value of linkedId, will this component be visible
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
      visibilityParameter: 'true', // for what value of linkedId, will this component be visible
    },
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
    default: true,
    dataType: 'boolean',
    row: true,
    options: options.passwordOrSecret,
    validate: {
      type: 'string',
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
    linked: {
      linkedId: 'passwordOrSecret',
      visibilityParameter: 'true', // for what value of linkedId, will this component be visible
    },
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
    helperText: 'The name of a pre-existing secret with a field "password" containing the password of the postgres instance',
    component: 'text',
    default: '',
    linked: {
      linkedId: 'passwordOrSecret',
      visibilityParameter: 'false', // for what value of linkedId, will this component be visible
    },
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
