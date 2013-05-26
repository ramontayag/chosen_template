# ChosenTemplate

Helper methods that allow users of an app to choose a template for one of the records, and previewing it before hand. Difficult to explain, but here's a scenario:

You have a CMS. Each page's layout can be changed by the owner of the site. The layout that was "published" by the user can be used to show to the public. However, before the layout is published, the user wants to preview the page in that new layout. To do this, the user "previews" it. This can be typically shown in another route namespace that only site owners have access.

## Installation

Add this line to your application's Gemfile:

    gem 'chosen_template'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chosen_template

## Usage

The item that can be preview and published:

    class PageTemplate < ActiveRecord::Base
      belongs_to :page
      choosable_template by: :page
    end

The model that does the choosing:

    class Page < ActiveRecord::Base
      has_many :page_templates
      chooses_templates :page_templates
    end

Here is how you would use it:

Get the page template that was chosen as the preview template:

    page.previewed_page_template

Get the page template that was chosen as the published template:

    page.published_page_template

Want to know if a specific page template is published template of the previewed template?

    page_template.previewed_template?
    page_template.published_template?

When you want to mark a page template as previewed:

    page_template.preview_template! # simply updates the page_template's template_previewed_at to be right now

When you want to mark a page template as published:

    page_template.publish_template! # simply updates the page_template's template_published_at to be right now

Other useful scopes that can be called on the collection of templates:

- `published_templates` returns templates that were ever published
- `previewed_templates` returns templates that were ever previewed
- `by_template_published_at` returns templates ordered by the date they were published, from most newest to oldest
- `by_template_previewed_at` returns templates ordered by the date they were previewed, from most newest to oldest

## Running Specs

In the root folder:

    bundle install
    cd spec/dummy
    rake db:migrate db:test:prepare
    rspec spec

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
