/*
 * Copyright © 2020 Blockchain Technology Partners Limited All Rights Reserved
 *
 * License: Product
 */

const common = require('./common')

const form = [

  'Network',

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
