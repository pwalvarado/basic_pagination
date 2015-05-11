# basic_paginate

This week kata is about howto make a basic library or a class (it could be a concern) that permit to add pagination funcionality to a webapp view (Initially Ruby on Rails, later Sinatra, Cuba or whatever).

Remember wotk with TDD!

## basic_paginate use

``` ruby
## perform a paginated query:
@posts = Post.paginate(:page => params[:page], :per_page => 30)

:per_page is a limit (number of rows to display)

## render page links in the view:
<%= basic_paginate @posts %>
```

And that's it! You're done. You just need to add some CSS styles to [make those pagination links prettier](http://mislav.uniqpath.com/will_paginate/)

Happy paginating.

Some inspiration guides:

- [will_paginate wiki](https://github.com/mislav/will_paginate/wiki)
- [css](http://mislav.uniqpath.com/will_paginate/)
- [kaminari](https://github.com/amatsuda/kaminari)