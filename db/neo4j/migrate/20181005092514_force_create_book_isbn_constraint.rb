class ForceCreateBookIsbnConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :Book, :isbn, force: true
  end

  def down
    drop_constraint :Book, :isbn
  end
end
