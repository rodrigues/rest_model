# encoding: utf-8

$:.push 'examples'; require 'helper'

class Root < RestModel
  property    :key,    id: true
  property    :locale, visible: false
  embeds_many :names,  class_name: 'Hash', visible: false
  property    :name,   from_source: proc {names[locale]}, to_source: proc {names[locale]}
end

names = {'en' => 'Woot', 'pt-BR' => 'Úia', 'es' => 'Me gusta'}

@root = Root.from_source!(locale: 'pt-BR', key: 19190839, names: names).first

inspect_rest_model(@root)
