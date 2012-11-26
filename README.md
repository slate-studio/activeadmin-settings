## activeadmin-settings

**IN DEVELOPMENT**

**TODO**: use yaml file only for settings synchronisation, all settings should be stored in db with all those default values and other meta.

Easy to use general purpose settings backend for activeadmin.

![ActiveadminSettings Demo](https://raw.github.com/slate-studio/activeadmin-settings/master/img/activeadmin-settings-demo.jpg)


### Installation

Add to `Gemfile`:

    gem "activeadmin-settings"

Run installer:

    $ rails g activeadmin_settings:install

#### ActiveRecord

    gem "aws-s3"
    gem "fog"
    gem "mini_magick"
    gem "carrierwave"

    gem "bson_ext"
    gem "devise"
    gem "activeadmin-settings"

Run migrations:

    $ rake activeadmin_settings:install:migrations
    $ rake db:migrate

#### Mongoid 2.x

If you're using mongoid 2.x the gem expects to see **activeadmin-mongoid** and **carrierwave-mongoid** (for image uploading feature) in Gemfile. Here is a working example:

    gem "aws-s3"
    gem "fog"
    gem "mini_magick"
    gem "carrierwave-mongoid"

    gem "bson_ext"
    gem "mongoid"
    gem "mongoid-globalize"
    gem "devise"
    gem "activeadmin-mongoid"
    gem "activeadmin-settings"

#### Mongoid 3.x

Here is an example of Gemfile with a support of 3.x version:

    # Mongoid 3.x
    gem 'moped',    git: 'git://github.com/mongoid/moped.git'
    gem 'mongoid',  '~> 3.0.5'

    # Assets
    gem 'aws-s3'
    gem 'fog'
    gem 'mini_magick'
    gem 'carrierwave-mongoid',  git:      'git://github.com/jnicklas/carrierwave-mongoid.git',
                                branch:   'mongoid-3.0',
                                require:  'carrierwave/mongoid'

    # Activeadmin
    gem 'devise',               '>= 2.1.2'
    gem 'activeadmin-mongoid',  git: 'git://github.com/elia/activeadmin-mongoid.git'
    gem "mongoid-globalize"
    gem 'activeadmin-settings'


### Configuration

After installation you should find a new **Settings** menu in the admin. If no configuration found in `config/activeadmin_settings.yml` only *Admins* tab is shown. *Admin* tab implements basic functionality of editing *AdminUser* objects.

To add some settings go to `config/activeadmin_settings.yml`. Settings are splitted into groups, each setting name concidered to be uniq, e.g.:

    SEO:
      Website Keywords:
        description:    These keywords are included in homepage header meta tag
        default_value:  lorem ipsum simply dummy text printing

      Website Description:
        type:           text
        description:    Website description is used as value for header meta tag on homepage
        default_value:  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.

There are a few types of settings:

* `string` (default) - a regular text input
* `link` - text input with a format: `(TITLE) URL`
* `text` - textarea input
* `html` - textarea with [redactor.js](http://redactorjs.com/)
* `file` - input for file upload

Some examples:

    Types Examples:
      Logo Image:
        type:           file
        description:    Please make sure logo image size is 287x140 pixels
        default_value:  home/home-logo.jpg

      CEO Message:
        type:           html
        description:    This text is used for the "CEO Message" page
        default_value:  >
                          <p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry.</p>
                          <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>

      Facebook Link:
        type:           link
        description:    Company facebook page link
        default_value:  (Facebook) https://www.facebook.com/


Settings could be integrated into templates as well as models or controllers code using `settings_value` helper. For example:

* `<%= settings_value("CEO Message") %>` - provides html
* `<%= image_tag setting_value("Logo Image") %>` - provides an image url: `<img src="/production-assets-path/home/home-logo.jpg" />`
* `<%= settings_value("Facebook Link") %>` - provides link: `<a href="https://www.facebook.com/" title="Facebook">Facebook</a>`


If setting value is `null` or an empty string default setting value is used which is defined in `config/activeadmin_settings.yml`.


### FUTURE FEATURES

I'm going to add types:

* `Boolean` - checkbox or dropdown with two values
* `Dropdown` - dropdown with options
* `List` - list bases selection

### GLHF
