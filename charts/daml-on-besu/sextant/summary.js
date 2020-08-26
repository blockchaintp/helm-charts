/*
 * Copyright © 2020 Blockchain Technology Partners Limited All Rights Reserved
 *
 * License: Product
 */

const summary = (values) => {
  const {
    deployment,
  } = values

  return [
    {
      title: 'Deployment Name',
      value: deployment.name,
    },
    {
      title: 'Namespace',
      value: deployment.namespace,
    },
    { title: 'DAML GRPC Port', value: '39000' },
  ]
};

module.exports = summary
