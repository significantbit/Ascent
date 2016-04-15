require 'closure_tree'

module Ascent
  class Node < ApplicationRecord
    has_closure_tree order: 'sort_order'

    has_many :node_blocks, dependent: :destroy

    after_validation :create_slug
    after_save :create_url

    def create_slug
      # self.slug = name.to_s.parameterize
      # save
    end

    def create_url
      # self.url = "/#{self_and_ancestors.reject(&:root?).map(&:slug).reverse.join('/')}"
      # save
      # descendants.each(&:create_url)
      Ascent::Engine.reload_routes
    end
  end
end
