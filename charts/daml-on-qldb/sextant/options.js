/*
 * Copyright © 2023 Paravela Limited All Rights Reserved
 *
 * License: Product
 */

const activated = [{
  value: true,
  title: 'Enabled',
}, {
  value: false,
  title: 'Disabled',
}]

const yesNo = [{
  value: true,
  title: 'Yes',
}, {
  value: false,
  title: 'No',
}]

const never = [{
  value: false,
  title: 'No',
}]

const awsRegion = [
  { value: "us-east-1", title: "US East (N. Virginia)" },
  { value: "us-east-2", title: "US East (Ohio)" },
  { value: "us-west-1", title: "US West (N. California)" },
  { value: "us-west-2", title: "US West (Oregon)" },
  { value: "ca-central-1", title: "Canada (Central)" },
  { value: "eu-west-1", title: "EU (Ireland)" },
  { value: "eu-central-1", title: "EU (Frankfurt)" },
  { value: "eu-west-2", title: "EU (London)" },
  { value: "eu-west-3", title: "EU (Paris)" },
  { value: "eu-north-1", title: "EU (Stockholm)" },
  { value: "ap-northeast-1", title: "Asia Pacific (Tokyo)" },
  { value: "ap-northeast-2", title: "Asia Pacific (Seoul)" },
  { value: "ap-southeast-1", title: "Asia Pacific (Singapore)" },
  { value: "ap-southeast-2", title: "Asia Pacific (Sydney)" },
  { value: "ap-south-1", title: "Asia Pacific (Mumbai)" },
  { value: "sa-east-1", title: "South America (São Paulo)" },
  { value: "us-gov-west-1", title: "US Gov West 1" },
  { value: "us-gov-east-1", title: "US Gov East 1" }
]

module.exports = {
  activated,
  yesNo,
  never,
  awsRegion,
}
