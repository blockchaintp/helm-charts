/*
 * Copyright © 2023 Paravela Limited All Rights Reserved
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
    { title: 'Daml GRPC Port', value: '39000' },
  ]
};

module.exports = summary
