const options = require('./options')
//`^[a-z0-9]([-a-z0-9]*[a-z0-9])?(\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*`
const form = [

  'Network',

  [
    {
      id: 'deployment.name',
      title: 'Network Name',
      helperText: 'The name of the DAML on Aurora Deployment',
      component: 'text',
      editable: {
        new: true,
      },
      validate: {
        type: 'string',
        methods: [
          ['required', 'Required'],
          ['matches', [`^[a-z]([-a-z0-9]*[a-z0-9])*$`], "a DNS-1123 label must consist of lower case alphanumeric characters or '-', and must start and end with an alphanumeric character"]
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
          ['matches', [`^[a-z]([-a-z0-9]*[a-z0-9])*$`], "a DNS-1123 label must consist of lower case alphanumeric characters or '-', and must start and end with an alphanumeric character"]
        ],
      },
    },

  ],

  'AWS Aurora Details',
  [
    {
    id: 'aws.db.create',
    title: 'Create Aurora DB?',
    helperText: 'Should this deployment create an Aurora Postgresql Database?',
    component: 'radio',
    default: true,
    dataType: 'boolean',
    row: true,
    options: options.yesNo,
    validate: {
      type: 'string',
      methods: [
        ['required', 'Required']
      ],
    },
  },
  {
    id: 'daml.postgres.secret',
    title: 'Database Connection Secret',
    helperText: 'The name of the secret containing the database connection details and credentials',
    component: 'text',
    linked: {
      linkedId: 'aws.db.create',
      visibilityParameter: 'false'
    },
    validate: {
      type: 'string',
      methods: [
        //['required', 'Required'],
        ['matches', [`^[a-z]([-a-z0-9]*[a-z0-9])*$|^(?![\\s\\S])$`], "a DNS-1123 label must consist of lower case alphanumeric characters or '-', and must start and end with an alphanumeric character"]
      ],
    },
  }
],

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
        ['matches', [`^[a-zA-Z]([-a-zA-Z0-9]*[a-zA-Z0-9])*$`], "a ledger id must consist of alphanumeric characters or '-', and must start and end with an alphanumeric character"]
      ],
    },
  },
  ''//empty string for form spacing
],

  'Image Pull Secrets',

  {
    id: 'imagePullSecrets.enabled',
    title: 'Do you need to enable image pull secrets?',
    helperText: 'Provide secrets to be injected into Sawtooth namespace and used to pull images from your secure registry',
    component: 'radio',
    default: false,
    dataType: 'boolean',
    row: true,
    options: options.yesNo,
    validate: {
      type: 'string',
      methods: [
        ['required', 'Required']
      ],
    },
  }, {
    id: 'imagePullSecrets.value',
    title: 'Image Pull Secrets',
    helperText: null,
    default: null,
    linked: {
      linkedId: 'imagePullSecrets.enabled',
      visibilityParameter: 'true' // for what value of linkedId, will this component be visible
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
            ['matches', [`^[a-z]([-a-z0-9]*[a-z0-9])*$`], "a DNS-1123 label must consist of lower case alphanumeric characters or '-', and must start and end with an alphanumeric character"]
          ],
        },
      }],
      table: [{
        title: 'Name',
        name: 'name',
      }]
    }
  },


]

module.exports = form
