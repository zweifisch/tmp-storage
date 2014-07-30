# TmpStorage

temporary localStorage

```coffeescript
store = new require('tmp-storage') 'somekey'  # the whole stuff will be stored as localStorage.somekey
store.setItem 'key', 'this key expires in 30 minutes', '30mins'
store.getItem 'key'
```

* objects will be encoded/decoded
* available time units: `sec(s)`, `min(s)`, `hour(s)`, `day(s)`
