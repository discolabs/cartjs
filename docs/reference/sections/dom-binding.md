DOM Binding is powered by Rivets.js, providing a flexible templating approach to cart rendering.

See the [DOM Binding] section in the Guide for more.

### Rivets Binders

A full breakdown of Rivets' available binders can be found under the Rivets docs [Binder Reference][].

### Formatters
The general syntax for formatters looks similar to Liquid filters, with a couple of key differences. In generic form, it can be seen as 
```
property | formatter
```

with the optional addition of arguments that can be passed to the formatter. In contrast to Liquid filters, formatters with arguments are not separated by colons, e.g. 
```
model.property | eq 'value'
```

[DOM Binding]: /pages/guide#dom-binding
[Binder Reference]: http://rivetsjs.com/docs/reference/