/*
 * Copyright © 2023 Paravela Limited All Rights Reserved
 *
 * License: Product
 */

const common = require('./common')

const form = [

  'NGINX Ingres Deployment',

  common.deploymentFields,

  'Image Pull Secrets',

  common.imagePullSecretsSwitch,

  common.imagePullSecretsValue,

  'Advanced Options',

  [
    '', // Emptry string acts as space in UI
  ],

]

module.exports = form
