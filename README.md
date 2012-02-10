Rails Wip
=========

## About

Rails Wip - as in **W**ork **I**n **P**rogress - is a very crude (no, really, I mean very crude!) [feature toggle](http://martinfowler.com/bliki/FeatureToggle.html) for rails apps.

## Installing

In your Gemfile:
	
	gem "rails_wip"

## Using

In your templates, wrap features which are still a work in progress in a `wip` block:

	<%= wip do %>
 		Work In Progress feature
	<% end %>

In development and test environments the wrapped sections will be displayed normally. But in other environments - namely production - those sections will not be displayed by default.

You can display the sections even in other environments by passing `wip=true` in a query string:

	http://example.com/example?wip=true

## Advantage

The only advantage I can think of for using this over other feature toggle implementations is that it is ridiculously easy to setup. You can have feature toggles working in literally a few seconds.

## Acknowledgements

The original code for this was implemented by [azisaka](https://github.com/azisaka) for a project we worked on together. Here I extracted the code and packaged it up as a gem.
