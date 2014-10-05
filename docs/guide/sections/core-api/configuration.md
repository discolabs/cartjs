In the "Setup" section above, we saw that we need to call `CartJS.init()` before use, like this:

{% raw %}
```html
<script type="text/javascript">
    jQuery(function() {
        CartJS.init({{ cart | json }}, {
            "dataAPI": false,
            "requestBodyClass": "loading"
        });
    });
</script>
```
{% endraw %}

As you can see, the `init()` method takes two arguments.
The first argument is required, and is provided by rendering the current Shopify cart as a JSON object through the {% raw %}`{{ cart | json }}`{% endraw %} Liquid tag.

The second argument is an optional hash of configuration options.
A full list of these options is available in the [Option Reference][].

[Option Reference]: /pages/reference/#options
