// var _ = require('lodash')

function filesystem (path) {
  var user = 'rcreasey'
  var fs = {
    '/': [
      {
        'permissions': 'drwxr-xr-x',
        'author': user,
        'size': '-',
        'mtime': '22 Jul  9:08',
        'name': 'bin'
      }, {
        'permissions': '.rw-r--r--',
        'author': user,
        'size': '28k',
        'mtime': '22 Jul  9:09',
        'name': 'README.md'
      }
    ]
  }

  return fs[path]
}

function ls (path = '/', options = {}) {
  path = '/'
  var cwd = filesystem(path)
  cwd = cwd.map(p => [p['permissions'], p['size'], p['author'], p['mtime'], p['name']].join('\t'))

  return cwd.join('\n')
}

function cat (filename, options = {}) {
  return 'cat: ' + filename + ': No such file or directory'
}

function evaluate (command, args) {
  switch (command) {
    case 'cat':
      return cat(args)
    case 'ls':
      return ls(args)
    default:
      return 'Command not found ' + command
  }
}

module.exports = {
  cat: cat,
  evaluate: evaluate,
  ls: ls
}
