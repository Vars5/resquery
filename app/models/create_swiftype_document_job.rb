class CreateSwiftypeDocumentJob < Struct.new(:article_id)
  def perform
    article = Article.find(article_id)
    group = Group.find(article.group_id)
    #topic = Topic.find(article.topic_id)
    
    url = Rails.application.routes.url_helpers.group_articles_url(group, article, :host => 'localhost:5000')
    
    engine = Swiftype::Engine.find('engine')
    type = engine.document_type('article')
    type.create_document({:external_id => article.id,
                                       :fields => [{:name => 'name', :value => article.name, :type => 'string'},
                                                   {:name => 'body', :value => article.body, :type => 'text'},
                                                   {:name => 'url', :value => url, :type => 'enum' },
                                                   {:name => 'created_at', :value =>article.created_at.iso8601, :type => 'date'}]
                                                   })
  end
end

