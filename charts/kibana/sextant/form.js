/*
 * Copyright © 2020 Blockchain Technology Partners Limited All Rights Reserved
 *
 * License: Product
 */

const options = require('./options')

const form = [

  'Kibana Deployment',

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
          [
            'matches', ['^[a-z]([-a-z0-9]*[a-z0-9])*$'],
            'a DNS-1123 label must consist of lower case alphanumeric characters or \'-\', and must start and end with an alphanumeric character',
          ],
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
          [
            'matches', ['^[a-z]([-a-z0-9]*[a-z0-9])*$'],
            'a DNS-1123 label must consist of lower case alphanumeric characters or \'-\', and must start and end with an alphanumeric character',
          ],
        ],
      },
    },

  ],

  'Image Pull Secrets',

  {
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
  },
  {
    id: 'imagePullSecrets.value',
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
            [
              'matches', ['^[a-z]([-a-z0-9]*[a-z0-9])*$'],
              'a DNS-1123 label must consist of lower case alphanumeric characters or \'-\', and must start and end with an alphanumeric character',
            ],
          ],
        },
      }],
      table: [{
        title: 'Name',
        name: 'name',
      }],
    },
  },

  'Advanced Options',

  [
    '', // Emptry string acts as space in UI
  ],

]

module.exports = form
