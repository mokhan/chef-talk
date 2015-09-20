[![Build Status](https://travis-ci.org/mokhan/chef-talk.svg?branch=master)](https://travis-ci.org/mokhan/chef-talk)

chef-talk Cookbook
==================
This cookbook creates provisions a server and preps it for deploying a
rails application to it.


Requirements
------------

Works on my box.

Attributes
----------
View the attributes/default.rb

Usage
-----
#### chef-talk::default
Just include `chef-talk` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef-talk]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
