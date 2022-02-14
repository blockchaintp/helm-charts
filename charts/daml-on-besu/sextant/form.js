/*
 * Copyright © 2020 Blockchain Technology Partners Limited All Rights Reserved
 *
 * License: Product
 */

const options = require('./options')
const common = require('./common')
const validators = require('./validators')

const form = [

  'Daml on Besu Deployment',

  common.deploymentFields,

  {
    id: 'besu.persistence.enabled',
    title: 'Besu Persistence',
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
    validate: {
      type: 'string',
      methods: [['required', 'Required']],
    },
  },
  {
    id: 'besu.persistence.storageClass',
    title: 'Besu StorageClass',
    helperText: 'The name of the StorageClass for the PersistentVolumeClaims',
    component: 'text',
    default: 'gp2',
    linked: {
      linkedId: 'besu.persistence.enabled',
      visibilityParameter: 'true', // for what value of linkedId, will this component be visible
    },
    editable: {
      new: true,
    },
    validate: {
      type: 'string',
      methods: [
        validators.dns1123,
      ],
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
    linked: {
      linkedId: 'postgres.persistence.enabled',
      visibilityParameter: 'true', // for what value of linkedId, will this component be visible
    },
    editable: {
      new: true,
    },
    validate: {
      type: 'string',
      methods: [
        [
          'matches', ['^[a-z]([-a-z0-9]*[a-z0-9])*$'],
          'a DNS-1123 label must consist of lower case alphanumeric characters or \'-\', and must start and end with an alphanumeric character',
        ],
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
