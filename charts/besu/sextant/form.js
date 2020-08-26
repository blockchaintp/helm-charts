/*
 * Copyright © 2020 Blockchain Technology Partners Limited All Rights Reserved
 *
 * License: Product
 */

const options = require('./options')
const common = require('./common')
const validators = require('./validators')

const form = [

  'Network',

  common.deploymentFields,

  common.affinityEnabled,

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
    default: null,
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

  'Image Pull Secrets',

  common.imagePullSecretsSwitch,

  common.imagePullSecretsValue,

  'Advanced Options',

  [
    '', // Emptry string acts as space in UI
  ],

]

module.exports = form
