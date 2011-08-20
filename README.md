# Transcriber

**Map from one or more input hashes** to instances of your model classes.

**Map to restful responses** from these model instances. (Some hypermedia magic happens here).

## Usage

### Input hash to model

Given you have:

    input = {
      "result" => [
        {
          "id"       => 1938713897398,
          "login"    => "jsmith180",
          "username" => "John Smith",
          "personal_info" => {
            "birth_date"      => "1999-02-10",
            "registered_date" => "2015-04-05"
          }
        },
        {
          "id"       => 92171987391873,
          "login"    => "john_appleseed",
          "username" => "John Appleseed",
          "personal_info" => {
            "birth_date"      => "1999-02-10",
            "registered_date" => "2015-04-05"
          }
        }
      ]
    }

And you want to transform this input in some instances of a `class User;   attr_accessor :id, :login, :name, :birth;   end`

With transcriber you can parse the input to instances of `User`:

    users = User.parse(input, :result)  # starts looking input hash from 'result' key

Just define your `User` class like this:

    class User < Transcriber::Resource
      id
      property :login
      property :name,  field: :username                  # input hash key is different from resource key
      property :birth, field: 'personal_info/birth_date' # digg hash path defined by '/', the last being the key
    end

### Model instances array to restful response hash

    User.resources(users)
=>

    {
      entries: [
        {
          id:    1938713897398,
          login: "jsmith180",
          name:  "John Smith",
          birth: "1999-02-10",
          href:  "http://app/api/users/1938713897398"
        },
        {
          id:    92171987391873,
          login: "john_appleseed",
          name:  "John Appleseed",
          birth: "1999-02-10",
          href:  "http://app/api/users/92171987391873"
        }
      ]
    }

### Model instance to restful response hash

    user.resource
=>

    {
      id:    1938713897398,
      login: "jsmith180",
      name:  "John Smith",
      birth: "1999-02-10",
      href:  "http://app/api/users/1938713897398"
    }

### Input hash to restful response hash

    User.transcribe(input, :result)

## Embedding other resources

### [embeds_one](https://github.com/rodrigues/transcriber/tree/master/examples/embeds_one)

    class Customer < Transcriber::Resource
      id field: 'cust_id'
      embeds_one :address
    end

    class Address < Transcriber::Resource
      property :street,
      property :number, field: 'n'
      properties :city, :state, :country
    end

    {
      id:    1938713897398,
      address: {
        street:  'transcriber st.',
        number:  '39',
        city:    'hashland',
        state:   'std',
        country: 'ruby'
      },
      href:  "http://app/api/users/1938713897398"
    }

### [embeds_many](https://github.com/rodrigues/transcriber/tree/master/examples/embeds_many)

    class OrderItems < Transcriber::Resource
      property :item_id,    id: true      # default serialization: String
      property :quantity,   type: Integer
      property :unit_price, type: Float
      property :amount,     type: Float
    end

    class Order < Transcriber::Resource
      id
      embeds_many :items, class: OrderItems
    end

    {
      id: 739819813719387,
      items: [
        {
          item_id:    1738917139871,
          quantity:   18,
          unit_price: 0.2,
          amount:     3.6
        },
        {
          item_id:    3987187398782,
          quantity:   1,
          unit_price: 39.9,
          amount:     39.9
        }
      ]
    }

## Relations

### has_one
### has_many
### belongs_to

    class User < Transcriber::Resource
      id
      property   :login
      has_one    :avatar
      has_many   :achievements
      belongs_to :guilda
    end

    {
      id:    19837139879,
      login: 'jsmith180',
      link: [
        {
          rel:  'avatar',
          href: 'http://app/api/users/19837139879/avatar'
        },
        {
          rel:  'achievements',
          href: 'http://app/api/users/19837139879/achievements'
        },
        {
          rel:  'guilda',
          href: 'http://app/api/users/19837139879/guilda
        }
      ]
    }

### embedding relations

If you want your api to handle `http://app/api/users/19371897318937?include[]=avatar&include[]=guilda`

    user = User.parse(input, include: [avatar_input, guilda_input]).first

    {
      id:    19837139879,
      login: 'jsmith180',
      avatar: {
        name:   'K1ll3r',
        specie: 'WTF'
      },
      guilda: {
        name: 'K1ll3rs'
      },
      link: [
        {
          rel:  'achievements',
          href: 'http://app/api/users/19837139879/achievements'
        }
      ]
    }

### [See more examples here](https://github.com/rodrigues/transcriber/tree/master/examples).

## Installation

    gem install transcriber

## Maintainers

* [Victor Rodrigues](http://github.com/rodrigues)
* [William "Kina"](http://github.com/kina)
* [Guilherme Guimarães Filho](http://github.com/gguimaraesbr)

## License

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
