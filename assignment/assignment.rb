require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment

  #
  # Insert rows in DB
  #
  def create_user(user_properties)
    User.create(user_properties)
  end

  def create_todolist(todo_list_properties)
    TodoList.create(
      list_name: todo_list_properties[:name],
      list_due_date: todo_list_properties[:due_date])
  end

  #
  # Retrieve paginated results from DB
  #
  def find_allusers(offset, limit)
    User.offset(offset).limit(limit).order(:updated_at)
  end

  def find_alllists(offset, limit)
    TodoList.offset(offset).limit(limit).order(list_due_date: :desc)
  end

  #
  # Query DB with exact match
  #
  def find_user_byname(username)
    User.where(username: username)
  end

  def find_todolist_byname(name)
    TodoList.where(list_name: name)
  end

  #
  # Get rows from DB by PK
  #
  def get_user_byid(id)
    User.find id
  end

  def get_todolist_byid(id)
    TodoList.find id
  end

  #
  # Update rows in DB
  #
  def update_password(id, password_digest)
    User.find(id).update password_digest: password_digest
  end

  def update_listname(id, name)
    TodoList.find(id).update list_name: name
  end

  #
  # Delete rows from DB
  #
  def delete_user(id)
    User.find(id).delete
  end

  def delete_todolist(id)
    TodoList.find(id).delete
  end
end
