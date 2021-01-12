const activated = [{
  value: true,
  title: 'Enabled',
}, {
  value: false,
  title: 'Disabled',
}]

const remoteOrLocal = [{
  value: true,
  title: 'Local',
}, {
  value: false,
  title: 'Remote',
}]

const passwordOrSecret = [
  {
    value: '1',
    title: 'Password',
  },
  {
    value: '2',
    title: 'Existing Secret',
  },

]

const yesNo = [{
  value: true,
  title: 'Yes',
}, {
  value: false,
  title: 'No',
}]

module.exports = {
  activated,
  yesNo,
  passwordOrSecret,
  remoteOrLocal,
}
