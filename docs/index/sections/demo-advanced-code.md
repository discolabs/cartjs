```html
<!-- Add to cart form, using Data API -->
<form data-cart-submit="data-cart-submit">
    <label>Select a Product</label>
    <select name="id">
        <option value="716986707">Coat</option>
        <option value="716934999">Hat</option>
    </select>

    <label>Choose a Quantity</label>
    <select name="quantity">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
    </select>

    <label>Add a Custom Label <small>Optional</small></label>
    <input type="text" name="properties[Custom Label]" />

    <button type="submit">Add to Cart</button>
</form>

<!-- Cart table, rendered using DOM Binding  -->
<table data-cart-view="data-cart-view">
    <thead>
        <tr>
            <th>Item</th>
            <th>Price</th>
            <th colspan="2">Qty</th>
            <th>Line Price</th>
        </tr>
    </thead>
    <tbody>
        <tr rv-each-item="cart.items">
            <td>
                <strong rv-text="item.title"></strong>
                <ul rv-hide="item.propertyArray | empty">
                    <li rv-each-property="item.propertyArray < properties">
                        <small class="text-muted">{property.name}: {property.value}</small>
                    </li>
                </ul>
            </td>
            <td rv-html="item.price | money Currency.currentCurrency"></td>
            <td>
                <a href="#" rv-data-cart-update="index | plus 1" rv-data-cart-quantity="item.quantity | minus 1">-</a>
                <span rv-text="item.quantity"></span>
                <a href="#" rv-data-cart-update="index | plus 1" rv-data-cart-quantity="item.quantity | plus 1">+</a>
            </td>
            <td>
                <a href="#" rv-data-cart-remove="index | plus 1">&times;</a>
            </td>
            <td rv-html="item.line_price | money Currency.currentCurrency"></td>
        </tr>
        <tr rv-show="cart.item_count | lt 1">
            <td colspan="5">You don't have any items in your cart.</td>
        </tr>
    </tbody>
    <tfoot rv-show="cart.item_count | gt 0">
        <tr>
            <td colspan="4" rv-html="cart.total_weight | weight_with_unit"></td>
            <td rv-html="cart.total_price | money Currency.currentCurrency"></td>
        </tr>
    </tfoot>
</table>

<img src="loader.gif" width="16" height="11" class="cart-visible-loading"/>
```
