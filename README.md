# TmpStorage

temporary localStorage

```javascript
var tmpStorage = new TmpStorage('somekey'); // the whole stuff will be stored as localStorage.somekey
tmpStorage.setItem('key','this key expires in 30 minutes','30mins');
tmpStorage.getItem('key');
```

* objects will be encoded/decoded
* available time units: `sec(s)`, `min(s)`, `hour(s)`, `day(s)`
