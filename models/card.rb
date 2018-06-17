class Card
  attr_accessor :id, :title, :body

  def self.open_connection
    conn = PG.connect(dbname: "blog")
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM card ORDER BY id"
    result = conn.exec(sql)
    posts = result.map do |tuple|
      self.hydrate(tuple)
    end
    return posts
  end

  def self.hydrate(post_data)
    post = Card.new
    post.id = post_data['id']
    post.title = post_data['title']
    post.body = post_data['body']
    return post
  end

  def self.find(id)
    conn = self.open_connection
    sql = "SELECT * FROM card WHERE ID = #{id}"
    result = conn.exec(sql)
  
    posts = self.hydrate(result[0])
    return posts
  end

  def save
    conn = Card.open_connection
    if(!self.id)
    sql = "INSERT INTO card(title,body) VALUES('#{self.title}', '#{self.body}')"
  else
    sql = "UPDATE card SET title='#{self.title}', body='#{self.body}' WHERE id = #{self.id}"
  end
    conn.exec(sql)
  end

  def self.destroy(id)
    conn = Card.open_connection
    sql= "DELETE FROM card WHERE ID = #{id}"
    conn.exec(sql)
  end
end
